import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/feature_recipes/domain/model/recipe.dart';
import 'package:recipes_app/feature_recipes/presentation/recipe_detail/recipes_detail_screen.dart';

typedef ToogleFavoritesCallback = void Function(Recipe);

class RecipeList extends StatelessWidget {
  const RecipeList({
    super.key,
    required this.recipes,
    required this.toogleFavoritesCallback,
    required this.favorites,
  });

  final List<Recipe> recipes;
  final ToogleFavoritesCallback toogleFavoritesCallback;
  final Set<String> favorites;

  @override
  Widget build(BuildContext context) {
    
    final theme = Theme.of(context);
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        bool isFavorite = favorites.contains(recipe.id);
        return InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  RecipeDetailScreen(recipe: recipe, isFavorite: isFavorite),
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
                trailing: IconButton(
                  onPressed: () => toogleFavoritesCallback(recipe),
                  icon: isFavorite
                      ? Icon(Icons.star, color: theme.colorScheme.primary)
                      : Icon(Icons.star_border),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
