import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/core/safe_scope.dart';
import 'package:recipes_app/feature_recipes/domain/model/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({
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
        centerTitle: true,
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(
          recipe.name,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.headlineMedium,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Hero(
                  tag: recipe.tumb,
                  child: CachedNetworkImage(
                    width: 150,
                    imageUrl: recipe.tumb,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Column(
                children: [
                  if (recipe.tags.isNotEmpty)
                    Text(recipe.category, style: theme.textTheme.bodySmall),
                  if (recipe.area.isNotEmpty)
                    Text(recipe.area, style: theme.textTheme.bodySmall),
                  if (recipe.tags.isNotEmpty)
                    Text(
                      "tags: ${recipe.tags}",
                      style: theme.textTheme.bodySmall,
                    ),
                ],
              ),

              Divider(),
              Text("Ingredients", style: theme.textTheme.titleLarge),
              ...List.generate(
                recipe.ingredients.length,
                (index) => DualText(
                  text1: recipe.ingredients[index],
                  text2: recipe.measures[index],
                ),
              ),
              Divider(),
              Text("Instructions", style: theme.textTheme.titleLarge),
              Text(recipe.instructions),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  Icon(Icons.star, size: 22, color: theme.primaryColor),
                  Text("LINK TO VIDEO"),
                  Icon(Icons.star, size: 22, color: theme.primaryColor),
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
      children: [
        Text(text1, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(text2),
      ],
    );
  }
}
