
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/feature_recipes/domain/use_cases/use_cases.dart';
import 'package:recipes_app/feature_recipes/presentation/recipes/recipes_event.dart';
import 'package:recipes_app/feature_recipes/presentation/recipes/recipes_state.dart';
import 'package:recipes_app/feature_recipes/presentation/recipes/recipes_state_holder.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final RecipeUseCases _useCases;

  /// This is the other state haha no the one that bloc uses for determining ui
  /// state, may using a different name would be easier (?) curse you bloc
  var _state = RecipesStateHolder.initial();

  RecipesBloc(this._useCases) : super(RecipesInitialState()) {
    on<GetRecipes>(_getNotes);
    on<AddToFavorites>(toogleFavorites);
    on<GetFavorites>(_getFavorites);
    on<ToogleFavorites>(_toogleFavorites);
    add(GetFavorites());
  }

  void _toogleFavorites(ToogleFavorites event, _) async =>
      await _useCases.toogleFavorites(event.recipe.id);

  void _getNotes(RecipesEvent event, Emitter<RecipesState> emit) async {
    emit(RecipesLoadingState());
    final result = await _useCases.getRecipes(true);

    result.when((recipes) {
      _state = _state.copyWith(recipes: recipes);
      emit(RecipesSuccessState(_state));
    }, (error) => emit(RecipesErrorStates(error)));
  }

  void toogleFavorites(RecipesEvent event, Emitter<RecipesState> emit) {}

  void _getFavorites(RecipesEvent event, Emitter<RecipesState> emit) async{
    await emit.forEach(
      _useCases.getFavorites(),
      onData: (data) {
        _state = _state.copyWith(favorites: data);
        return RecipesSuccessState(_state);
      },
    );
  }
}
