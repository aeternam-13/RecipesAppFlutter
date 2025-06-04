import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/feature_recipes/domain/model/recipe.dart';
import 'package:recipes_app/feature_recipes/presentation/recipe_detail/recipes_detail_screen.dart';

class RecipeDetailList extends StatelessWidget {
  const RecipeDetailList({super.key, required this.recipes});
  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  RecipeDetailScreen(recipe: recipe, addToFavorites: () => {}),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 2.0, top: 2.0),
            child: Card(
              elevation: 6,
              child: ListTile(
                leading: Hero(
                  tag: recipe.tumb,
                  child: CachedNetworkImage(
                    width: 40,
                    imageUrl: recipe.tumb,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                title: Text(
                  recipe.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(recipe.category),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ),
        );
      },
    );
  }
}
