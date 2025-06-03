import 'package:dart_mappable/dart_mappable.dart';
import 'package:recipes_app/feature_recipes/domain/model/recipe.dart';

part 'recipes_state_holder.mapper.dart';

@MappableClass()
class RecipesStateHolder with RecipesStateHolderMappable {
  final Set<String> favorites;
  final List<Recipe> recipes;

  RecipesStateHolder({required this.favorites, required this.recipes});

  RecipesStateHolder.initial() : favorites = {}, recipes = [];
}
