import 'package:dart_mappable/dart_mappable.dart';
import 'package:recipes_app/feature_recipes/domain/model/recipe.dart';

part 'recipe_search_state_holder.mapper.dart';

@MappableClass()
class RecipeSearchStateHolder with RecipeSearchStateHolderMappable {
  final List<Recipe> filtered;
  final List<Recipe> allRecipes;
  final String value;
  final Set<String> favorites;

  RecipeSearchStateHolder({
    required this.filtered,
    required this.allRecipes,
    required this.value,
    required this.favorites,
  });

  RecipeSearchStateHolder.initial()
    : filtered = [],
      allRecipes = [],
      value = "",
      favorites = {};
}
