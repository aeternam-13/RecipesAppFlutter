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
    on<EnteredValue>(_enteredValue);
    on<Search>(_searchRecipes);
  }

  void _searchRecipes(Search event, Emitter<RecipeSearchState> emit) async {
    if (state == SearchingState() || _state.value.length < 3) return;
    emit(SearchingState());

    final filtered = await _useCases.searchRecipe(
      _state.allRecipes,
      _state.value,
    );

    _state = _state.copyWith(filtered: filtered);

    await Future.delayed(Duration(seconds: 1));
    emit(SearchFoundState(recipesFound: _state.filtered));
  }

  void _enteredValue(EnteredValue event, Emitter<RecipeSearchState> emit) {
    _state = _state.copyWith(value: event.value);
    if (_state.value.isEmpty) {
      _state = _state.copyWith(filtered: []);
      emit(EmptySearchState());
    }
  }

  void _getNotes(
    RecipeSearchEvent event,
    Emitter<RecipeSearchState> emit,
  ) async {
    emit(SearchingState());
    final result = await _useCases.getRecipes(false);

    result.when((recipes) {
      _state = _state.copyWith(allRecipes: recipes);
    }, (error) => emit(ErrorSearch(error)));

    emit(EmptySearchState());
  }
}
