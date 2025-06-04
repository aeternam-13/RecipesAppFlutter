sealed class RecipeSearchEvent {}

class EnteredValue extends RecipeSearchEvent {
  final String value;
  EnteredValue({required this.value});
}

class Search extends RecipeSearchEvent {}

class SerachResult extends RecipeSearchEvent {}

class GetRecipes extends RecipeSearchEvent {}
