import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';
import 'package:http/http.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:recipes_app/core/errors.dart';
import 'package:recipes_app/feature_recipes/data/data_source/recipe_dao.dart';
import 'package:recipes_app/feature_recipes/domain/model/recipe.dart';
import 'package:http/http.dart' as http;

/// Here i did a mix of http + hive because i'm limited by the API, if i had my
/// own back end that could be done by requests
class RecipeDaoImpl extends RecipeDao {
  final String _baseUrl = "https://www.themealdb.com/api/json/v1/1/";

  final int _requestTimeout = 5;

  final Box _box = Hive.box<Set<String>>('favoritesBox');

  final String _favoritesKey = "favorites";

  @override
  Future<Result<List<Recipe>, RecipesException>> getRecipes() async {
    const letters = 'abcdefghijklmnopqrstuvwxyz';
    final List<Future<Result<List<Recipe>, RecipesException>>> futures = [];

    for (int i = 0; i < letters.length; i++) {
      String letter = letters[i];
      futures.add(fetchRecipes(letter));
    }

    final List<Result<List<Recipe>, RecipesException>> allResults =
        await Future.wait(futures);

    List<Recipe> allRecipes = [];
    bool allFailed = true;

    for (var result in allResults) {
      if (result is Success<List<Recipe>, RecipesException>) {
        allRecipes.addAll(result.success);
        allFailed = false;
      }
    }

    if (allFailed) {
      return Error(
        ApiError(statusCode: 500, message: "All recipe requests failed."),
      );
    }
    return Success(allRecipes);
  }

  Future<Result<List<Recipe>, RecipesException>> fetchRecipes(
    String letter,
  ) async {
    String url = '${_baseUrl}search.php?f=$letter';
    try {
      final response = await http
          .get(Uri.parse(url), headers: _buildHeaders())
          .timeout(
            Duration(seconds: _requestTimeout),
            onTimeout: () => _timeoutResponse(),
          );
      switch (response.statusCode) {
        case HttpStatus.ok:
          final List<Recipe> recipes = await compute(
            _parseRecipesJson,
            response.body,
          );
          return Success(recipes);
        default:
          return Error(ApiError(statusCode: response.statusCode));
      }
    } on RecipeParseError catch (e) {
      return Error(e);
    } catch (e) {
      return Error(ApiError(statusCode: 500, message: "as"));
    }
  }

  // Static method for JSON parsing to be run in an Isolate
  static List<Recipe> _parseRecipesJson(String responseBody) {
    try {
      final jsonBody = jsonDecode(responseBody);
      return Recipe.getRecipeFromResponse(jsonBody);
    } catch (e) {
      rethrow;
    }
  }

  /// Method to generate the required headers for the application
  Map<String, String> _buildHeaders() {
    Map<String, String> headers = {};

    headers[HttpHeaders.contentTypeHeader] = "application/json";

    return headers;
  }

  Response _timeoutResponse() =>
      http.Response("Request timeout", HttpStatus.requestTimeout);

  @override
  Stream<Set<String>> getFavorites() async* {
    yield _getFavorites();

    yield* _box.watch(key: _favoritesKey).map((_) => _getFavorites());
  }

  Set<String> _getFavorites() {
    final favorites = _box.get(_favoritesKey, defaultValue: <String>{});
    return favorites!.toSet();
  }

  @override
  Future<void> toggleFavorite(String id) async {
    final current = _getFavorites();
    if (current.contains(id)) {
      current.remove(id);
    } else {
      current.add(id);
    }
    await _box.put(_favoritesKey, current);
  }
}
