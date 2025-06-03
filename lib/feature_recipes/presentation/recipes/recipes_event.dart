abstract class RecipesEvent {}

class GetRecipes extends RecipesEvent {}

class AddToFavorites extends RecipesEvent {}

class GetFavorites extends RecipesEvent {}

class ToogleFavorites extends RecipesEvent {}
