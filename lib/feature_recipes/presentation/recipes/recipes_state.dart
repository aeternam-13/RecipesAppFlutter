import 'package:recipes_app/core/errors.dart';
import 'package:recipes_app/feature_recipes/domain/model/recipe.dart';

abstract class RecipesState {}

class RecipesInitialState extends RecipesState {}

class RecipesLoadingState extends RecipesState {}

class RecipesSuccessState extends RecipesState {
  final List<Recipe> recipes;

  RecipesSuccessState(this.recipes);
}

class RecipesErrorStates extends RecipesState {
  final RecipesException error;

  RecipesErrorStates(this.error);
}
