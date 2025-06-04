sealed class RecipeSearchEvent {}

class EnteredValue extends RecipeSearchEvent {
  final String value;
  EnteredValue({required this.value});
}

class Searched extends RecipeSearchEvent {}

class GetRecipes extends RecipeSearchEvent {}
