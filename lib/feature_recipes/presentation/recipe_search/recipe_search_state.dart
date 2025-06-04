import 'package:recipes_app/core/errors.dart';
import 'package:recipes_app/feature_recipes/domain/model/recipe.dart';

sealed class RecipeSearchState {}

class EmptySearchState extends RecipeSearchState {}

class SearchingState extends RecipeSearchState {}

class SearchLoading extends RecipeSearchState {}

class ErrorSearch extends RecipeSearchState {
  final RecipesException error;

  ErrorSearch(this.error);
}

class SearchFoundState extends RecipeSearchState {
  final List<Recipe> recipesFound;

  SearchFoundState({required this.recipesFound});
}
