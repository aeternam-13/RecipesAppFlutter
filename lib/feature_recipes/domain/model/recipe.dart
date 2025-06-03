import 'dart:developer';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:recipes_app/core/errors.dart';
import 'package:recipes_app/core/sanitizer.dart';
part 'recipe.mapper.dart';

@MappableClass()
class Recipe with RecipeMappable {
  final String id;
  final String name;
  final String tumb;
  final String tags;
  final String videoLink;
  final String category;
  final String area;
  final String mealAlternate;
  final String instructions;
  final List<String> ingredients;
  final List<String> measures;

  Recipe({
    required this.id,
    required this.name,
    required this.tumb,
    required this.tags,
    required this.videoLink,
    required this.category,
    required this.area,
    required this.mealAlternate,
    required this.instructions,
    required this.ingredients,
    required this.measures,
  });

  static List<Recipe> getRecipeFromResponse(Map<String, dynamic> json) {
    log("get recipe from json");
    if (json[RecipesKeys.meals.name] == null ||
        json[RecipesKeys.meals.name].runtimeType != List) {
      throw RecipeParseError(message: "No recipes in response");
    }

    List<Recipe> recipes = [];

    List<dynamic> jsonRecipes = json[RecipesKeys.meals.name];

    for (final jsonRecipe in jsonRecipes) {
      try {
        final recipe = Recipe.fromBadApi(jsonRecipe);
        recipes.add(Recipe.fromBadApi(jsonRecipe));
        log(recipe.toString());
      } catch (e) {
        log("A recipe couldn't be parsed");
      }
    }

    return recipes;
  }

  factory Recipe.fromBadApi(Map<String, dynamic> json) {
    log("im in bad api");
    String id = "";
    String name = "";
    String tumb = "";
    String tags = "";
    String videoLink = "";
    String category = "";
    String area = "";
    String instructions = "";
    String mealAlternate = "";
    List<String> ingredients = [];
    List<String> measures = [];

    id = sanitizeString(json, RecipesKeys.idMeal.name, required: true);
    name = sanitizeString(json, RecipesKeys.strMeal.name, required: true);
    tumb = sanitizeString(json, RecipesKeys.strMealThumb.name);
    tags = sanitizeString(json, RecipesKeys.strTags.name);
    videoLink = sanitizeString(json, RecipesKeys.strYoutube.name);
    category = sanitizeString(json, RecipesKeys.strCategory.name);
    area = sanitizeString(json, RecipesKeys.strArea.name);
    mealAlternate = sanitizeString(json, RecipesKeys.strIngredient.name);
    instructions = sanitizeString(
      json,
      RecipesKeys.strInstructions.name,
      required: true,
    );

    int max = 20;

    int i = 0;

    ///Did it like this because im not sure if they will sent same ammount of
    ///incredients and measures, maybe the send an ingredient without measures in the middle

    ///To get all ingredients
    for (i = 0; i < max; i++) {
      String ingredientKey = '${RecipesKeys.strIngredient.name}i';
      String measureKey = '${RecipesKeys.strMeasure.name}i';
      if (!json.containsKey(ingredientKey)) break;
      String ingredient = sanitizeString(json, ingredientKey);
      String measure = sanitizeString(json, measureKey);
      if (ingredient.trim().isNotEmpty) {
        ingredients.add(ingredient);
        measures.add(measure);
      }
    }

    return Recipe(
      id: id,
      name: name,
      tumb: tumb,
      tags: tags,
      videoLink: videoLink,
      category: category,
      area: area,
      mealAlternate: mealAlternate,
      instructions: instructions,
      ingredients: ingredients,
      measures: measures,
    );
  }
}

enum RecipesKeys {
  meals,
  idMeal,
  strMeal,
  strMealThumb,
  strTags,
  strYoutube,
  strCategory,
  strArea,
  strIngredient,
  strMeasure,
  strInstructions,
}
