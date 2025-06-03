import 'package:multiple_result/multiple_result.dart';
import 'package:recipes_app/core/errors.dart';
import 'package:recipes_app/feature_recipes/domain/model/recipe.dart';

abstract class RecipesRepository {
  Future<Success<Recipe, RecipesException>> getRecipes();
}
