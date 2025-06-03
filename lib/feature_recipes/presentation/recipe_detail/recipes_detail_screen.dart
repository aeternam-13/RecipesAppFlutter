import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/core/safe_scope.dart';
import 'package:recipes_app/feature_recipes/domain/model/recipe.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({
    super.key,
    required this.recipe,
    required this.addToFavorites,
  });

  final Recipe recipe;
  final VoidCallback addToFavorites;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeScope(
      appBar: AppBar(
        title: Text("Recipe details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                recipe.name,
                textAlign: TextAlign.left,
                style: theme.textTheme.headlineLarge,
              ),
              if (recipe.tags.isNotEmpty) Text("tags: ${recipe.tags}"),

              Text("Ingredients", textAlign: TextAlign.left),
              ...List.generate(
                recipe.ingredients.length,
                (index) => DualText(
                  text1: recipe.ingredients[index],
                  text2: recipe.measures[index],
                ),
              ),
              Text("Instructions", textAlign: TextAlign.left),
              Text(recipe.instructions),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  width: 200,
                  imageUrl: recipe.tumb,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  Icon(Icons.star),
                  Text("LINK TO VIDEO"),
                  Icon(Icons.star),
                ],
              ),
              Text(recipe.videoLink, style: theme.textTheme.labelLarge),
            ],
          ),
        ),
      ),
    );
  }
}

class DualText extends StatelessWidget {
  const DualText({super.key, required this.text1, required this.text2});

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(text1), Text(text2)],
    );
  }
}
