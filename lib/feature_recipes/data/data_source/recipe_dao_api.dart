import 'dart:convert';
import 'dart:io';
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

  final int _requestTimeout = 20;

  final Box _box = Hive.box<Set<String>>('favoritesBox');

  @override
  Future<Result<List<Recipe>, RecipesException>> getRecipes() async {
    String url = '${_baseUrl}search.php?f=a';
    try {
      final response = await http
          .get(Uri.parse(url), headers: _buildHeaders())
          .timeout(
            Duration(seconds: _requestTimeout),
            onTimeout: () => _timeoutResponse(),
          );
      switch (response.statusCode) {
        case HttpStatus.ok:
          final jsonBody = jsonDecode(response.body);
          return Success(Recipe.getRecipeFromResponse(jsonBody));
        default:
          return Error(ApiError(statusCode: response.statusCode));
      }
    } on RecipeParseError catch (e) {
      return Error(e);
    } catch (e) {
      return Error(ApiError(statusCode: 500, message: "as"));
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

  Stream<Set<String>> get favoritesStream async* {
    // Yield the current favorites immediately
    yield _getFavorites();

    // Then yield on every change
    yield* _box.watch(key: 'favorites').map((_) {
      return _box.get('favorites', defaultValue: <String>{})!.sasasa();
    });
  }

  Set<String> _getFavorites() {
    Set<String> favorites = _box.get("key", defaultValue: <String>{});
    return favorites.toSet();
  }
}
