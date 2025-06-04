import 'package:recipes_app/feature_recipes/domain/model/recipe.dart';

sealed class RecipeSearchEvent {}

class EnteredValue extends RecipeSearchEvent {
  final String value;
  EnteredValue({required this.value});
}

class Search extends RecipeSearchEvent {}

class SerachResult extends RecipeSearchEvent {}

class GetRecipes extends RecipeSearchEvent {}

class GetFavorites extends RecipeSearchEvent {}

class ToogleFavorites extends RecipeSearchEvent {
  final Recipe recipe;
  ToogleFavorites({required this.recipe});
}


