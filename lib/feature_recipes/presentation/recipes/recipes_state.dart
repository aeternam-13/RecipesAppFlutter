import 'package:recipes_app/core/errors.dart';
import 'package:recipes_app/feature_recipes/presentation/recipes/recipes_state_holder.dart';

sealed class RecipesState {}

class RecipesInitialState extends RecipesState {}

class RecipesLoadingState extends RecipesState {}

class RecipesSuccessState extends RecipesState {
  final RecipesStateHolder stateHolder;

  RecipesSuccessState(this.stateHolder);
}

class RecipesErrorStates extends RecipesState {
  final RecipesException error;

  RecipesErrorStates(this.error);
}
