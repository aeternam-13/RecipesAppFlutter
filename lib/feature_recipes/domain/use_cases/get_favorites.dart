import 'package:recipes_app/feature_recipes/domain/repository/recipe_repository.dart';

class GetFavorites {
  final RecipeRepository repository;

  GetFavorites(this.repository);

  Stream<Set<String>> call() => repository.getFavorites();
}
