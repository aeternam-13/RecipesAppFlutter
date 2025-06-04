import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/core/safe_scope.dart';
import 'package:recipes_app/feature_recipes/domain/model/recipe.dart';
import 'package:recipes_app/feature_recipes/presentation/common/recipe_detail.dart';
import 'package:recipes_app/feature_recipes/presentation/recipe_search/recipe_search_bloc.dart';
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
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: context.read<RecipeSearchBloc>(),
                    child: RecipeSearchScreen(),
                  ),
                ),
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
                return const Center(child: Text('Nothing yet'));

              case RecipesLoadingState():
                return const Center(child: CircularProgressIndicator());

              case RecipesSuccessState():
                final recipes = state.stateHolder.recipes;
                return RecipeList(
                  recipes: recipes,
                  favorites: state.stateHolder.favorites,
                  toogleFavoritesCallback: (Recipe recipe) {
                    context.read<RecipesBloc>().add(
                      ToogleFavorites(recipe: recipe),
                    );
                  },
                );

              case RecipesErrorStates():
                return Center(
                  child: Column(
                    children: [
                      Icon(Icons.error, color: Colors.red, size: 60),
                      Text("An error as ocurred"),
                      Text('Error: ${state.error}'),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
