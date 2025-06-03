import 'package:recipes_app/feature_recipes/domain/use_cases/get_favorites.dart';
import 'package:recipes_app/feature_recipes/domain/use_cases/toogle_favorites.dart';
import 'package:recipes_app/feature_recipes/domain/use_cases/get_recipes.dart';

class RecipeUseCases {
  final GetRecipes getRecipes;
  final ToogleFavorites toogleFavorites;
  final GetFavorites getFavorites;

  RecipeUseCases({
    required this.getRecipes,
    required this.toogleFavorites,
    required this.getFavorites,
  });
}
