sealed class RecipesException implements Exception {}

class ApiError extends RecipesException {
  final int statusCode;
  final String message;
  ApiError({required this.statusCode, this.message = ""});
}

class RecipeParseError extends RecipesException {
  final String message;
  RecipeParseError({required this.message});
}
