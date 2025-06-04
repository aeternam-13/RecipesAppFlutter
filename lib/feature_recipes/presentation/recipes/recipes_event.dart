import 'package:recipes_app/feature_recipes/domain/model/recipe.dart';

abstract class RecipesEvent {}

class GetRecipes extends RecipesEvent {}

class AddToFavorites extends RecipesEvent {}

class GetFavorites extends RecipesEvent {}

class ToogleFavorites extends RecipesEvent {
  final Recipe recipe;
  ToogleFavorites({required this.recipe});
}
