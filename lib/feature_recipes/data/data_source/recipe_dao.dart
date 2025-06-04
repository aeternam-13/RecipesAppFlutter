import 'package:multiple_result/multiple_result.dart';
import 'package:recipes_app/core/errors.dart';
import 'package:recipes_app/feature_recipes/domain/model/recipe.dart';

abstract class RecipeDao {
  Future<Result<List<Recipe>, RecipesException>> getRecipes(bool reload);
  Future<void> toggleFavorite(String id);
  Stream<Set<String>> getFavorites();
}
