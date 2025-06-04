import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:recipes_app/feature_recipes/domain/use_cases/use_cases.dart';
import 'package:recipes_app/feature_recipes/presentation/recipe_search/recipe_search_event.dart';
import 'package:recipes_app/feature_recipes/presentation/recipe_search/recipe_search_state.dart';
import 'package:recipes_app/feature_recipes/presentation/recipe_search/recipe_search_state_holder.dart';

class RecipeSearchBloc extends Bloc<RecipeSearchEvent, RecipeSearchState> {
  final RecipeUseCases _useCases;

  var _state = RecipeSearchStateHolder.initial();

  RecipeSearchBloc(this._useCases) : super(EmptySearchState()) {
    on<GetRecipes>(_getNotes);
  }

  void _getNotes(
    RecipeSearchEvent event,
    Emitter<RecipeSearchState> emit,
  ) async {
    emit(SearchLoading());
    final result = await _useCases.getRecipes(false);

    result.when((recipes) {
      _state = _state.copyWith(allRecipes: recipes);
    }, (error) => emit(ErrorSearch(error)));
  }
}
