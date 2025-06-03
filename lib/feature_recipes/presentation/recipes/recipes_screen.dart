import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/core/safe_scope.dart';
import 'package:recipes_app/feature_recipes/data/data_source/recipe_dao_api.dart';
import 'package:recipes_app/feature_recipes/presentation/recipe_detail/recipes_detail_screen.dart';
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

  void _testAPI() async {
    final api = RecipeDaoApi();
    final result = await api.getRecipes();
    log(result.toString());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeScope(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("RecipesApp", style: theme.textTheme.headlineLarge),
            IconButton(onPressed: _testAPI, icon: Icon(Icons.settings)),
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
                          builder: (context) => RecipeDetail(
                            recipe: recipe,
                            addToFavorites: () => {},
                          ),
                        ),
                      ),
                      child: ListTile(
                        title: Text(recipe.name),
                        subtitle: Text(recipe.category),
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
