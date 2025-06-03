import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/feature_recipes/domain/use_cases/use_cases.dart';
import 'package:recipes_app/feature_recipes/presentation/recipes/recipes_event.dart';
import 'package:recipes_app/feature_recipes/presentation/recipes/recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final RecipeUseCases _useCases;

  RecipesBloc(this._useCases) : super(RecipesInitialState()) {
    on<GetRecipes>(_getNotes);
  }

  void _getNotes(RecipesEvent event, Emitter<RecipesState> emit) async {
    emit(RecipesLoadingState());
    final result = await _useCases.getRecipes();
    result.when(
      (recipes) => emit(RecipesSuccessState(recipes)),
      (error) => emit(RecipesErrorStates(error)),
    );
  }
}
