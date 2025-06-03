import 'package:recipes_app/feature_recipes/domain/repository/recipe_repository.dart';

class ToogleFavorites {
  final RecipeRepository repository;

  ToogleFavorites(this.repository);

  Future<void> call(String recipeId) => repository.toogleFavorites(recipeId);
}
