import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/core/safe_scope.dart';
import 'package:recipes_app/feature_recipes/domain/model/recipe.dart';
import 'package:recipes_app/feature_recipes/presentation/common/recipe_detail.dart';
import 'package:recipes_app/feature_recipes/presentation/recipe_search/recipe_search_bloc.dart';
import 'package:recipes_app/feature_recipes/presentation/recipe_search/recipe_search_event.dart';
import 'package:recipes_app/feature_recipes/presentation/recipe_search/recipe_search_state.dart';

class RecipeSearchScreen extends StatefulWidget {
  const RecipeSearchScreen({super.key});

  @override
  State<RecipeSearchScreen> createState() => _RecipeSearchScreenState();
}

class _RecipeSearchScreenState extends State<RecipeSearchScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "");
    context.read<RecipeSearchBloc>().add(GetRecipes());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeScope(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text("Search recipes"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                    onChanged: (val) => context.read<RecipeSearchBloc>().add(
                      EnteredValue(value: val),
                    ),
                    decoration: InputDecoration(
                      label: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        padding: const EdgeInsets.only(
                          left: 3,
                          right: 3,
                          top: 4,
                        ),
                        child: const Text('Search'),
                      ),

                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      context.read<RecipeSearchBloc>().add(Search()),
                  icon: Icon(
                    Icons.search,
                    size: 32,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),

            BlocBuilder<RecipeSearchBloc, RecipeSearchState>(
              builder: (context, state) {
                switch (state) {
                  case EmptySearchState():
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Enter any text with 3 or more letters and press search button",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  case SearchingState():
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LinearProgressIndicator(),
                    );

                  case ErrorSearch():
                    return SizedBox.shrink();
                  case SearchFoundState():
                    if (state.stateHolder.filtered.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(Icons.warning, color: Colors.amber, size: 60),
                          Text(
                            "No results found",
                            style: theme.textTheme.labelLarge,
                          ),
                        ],
                      );
                    }
                    return Expanded(
                      child: RecipeList(
                        favorites: state.stateHolder.favorites,
                        recipes: state.stateHolder.filtered,
                        toogleFavoritesCallback: (Recipe recipe) {
                          context.read<RecipeSearchBloc>().add(
                            ToogleFavorites(recipe: recipe),
                          );
                        },
                      ),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
