import 'package:recipes_app/feature_recipes/domain/repository/recipe_repository.dart';

class AddToFavorites {
  final RecipeRepository repository;

  AddToFavorites(this.repository);

  Future<void> call(String recipeId) {
    return repository.addToFavorites(recipeId);
  }
}
