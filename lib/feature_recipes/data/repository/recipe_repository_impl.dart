import 'package:multiple_result/multiple_result.dart';
import 'package:recipes_app/core/errors.dart';
import 'package:recipes_app/feature_recipes/data/data_source/recipe_dao.dart';
import 'package:recipes_app/feature_recipes/domain/model/recipe.dart';
import 'package:recipes_app/feature_recipes/domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final RecipeDao _dao;

  RecipeRepositoryImpl(this._dao);

  @override
  Future<Result<List<Recipe>, RecipesException>> getRecipes() =>
      _dao.getRecipes();

  @override
  Future<void> toogleFavorites(String recipeId) =>
      _dao.toggleFavorite(recipeId);
}
