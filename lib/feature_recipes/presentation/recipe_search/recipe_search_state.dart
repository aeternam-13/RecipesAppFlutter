import 'package:recipes_app/core/errors.dart';
import 'package:recipes_app/feature_recipes/presentation/recipe_search/recipe_search_state_holder.dart';

sealed class RecipeSearchState {}

class EmptySearchState extends RecipeSearchState {}

class SearchingState extends RecipeSearchState {}

class ErrorSearch extends RecipeSearchState {
  final RecipesException error;

  ErrorSearch(this.error);
}

class SearchFoundState extends RecipeSearchState {
  final RecipeSearchStateHolder stateHolder;


  SearchFoundState({required this.stateHolder});
}
