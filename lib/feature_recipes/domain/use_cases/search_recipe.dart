import 'package:flutter/foundation.dart';
import 'package:recipes_app/feature_recipes/domain/model/recipe.dart';

class SearchRecipe {
  Future<List<Recipe>> call(List<Recipe> all, String value) async {
    return await compute(findInRecipes, SerachArgs(list: all, value: value));
  }

  List<Recipe> findInRecipes(SerachArgs args) {
    final List<Recipe> filtered = [];

    for (Recipe recipe in args.list) {
      if (recipe.name.toLowerCase().contains(args.value) ||
          recipe.tags.contains(args.value) ||
          recipe.category.contains(args.value)) {
        filtered.add(recipe);
      }
    }
    return filtered;
  }
}

class SerachArgs {
  final List<Recipe> list;
  final String value;

  SerachArgs({required this.list, required this.value});
}
