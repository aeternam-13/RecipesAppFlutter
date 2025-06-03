import 'package:recipes_app/feature_recipes/domain/use_cases/add_to_favorites.dart';
import 'package:recipes_app/feature_recipes/domain/use_cases/get_recipes.dart';

class RecipeUseCases {
  final GetRecipes getRecipes;
  final AddToFavorites addToFavorites;

  RecipeUseCases({required this.getRecipes, required this.addToFavorites});
}
