import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/core/safe_scope.dart';
import 'package:recipes_app/feature_recipes/data/data_source/recipe_dao_api.dart';
import 'package:recipes_app/feature_recipes/presentation/recipe_detail/recipes_detail_screen.dart';
import 'package:recipes_app/feature_recipes/presentation/recipe_search/recipe_search_screen.dart';
import 'package:recipes_app/feature_recipes/presentation/recipes/recipes_bloc.dart';
import 'package:recipes_app/feature_recipes/presentation/recipes/recipes_event.dart';
import 'package:recipes_app/feature_recipes/presentation/recipes/recipes_state.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RecipesBloc>().add(GetRecipes());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeScope(
      floatingButton: FloatingActionButton(
        onPressed: () => context.read<RecipesBloc>().add(GetRecipes()),
        child: Icon(Icons.refresh, size: 32),
      ),
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("RecipesApp", style: theme.textTheme.headlineMedium),
            IconButton(
              iconSize: 28,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => RecipeSearchScreen()),
              ),
              icon: Icon(Icons.search),
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<RecipesBloc, RecipesState>(
          builder: (context, state) {
            switch (state) {
              case RecipesInitialState():
                return const Center(child: Text('No data'));

              case RecipesLoadingState():
                return const Center(child: CircularProgressIndicator());

              case RecipesSuccessState():
                final recipes = state.stateHolder.recipes;
                return ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = recipes[index];
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailScreen(
                            recipe: recipe,
                            addToFavorites: () => {},
                          ),
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
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
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

              case RecipesErrorStates():
                return Center(child: Text('Error: ${state.error}'));
            }
          },
        ),
      ),
    );
  }
}
