import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:recipes_app/core/safe_scope.dart';
import 'package:recipes_app/feature_recipes/data/data_source/recipe_dao_api.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  void _testAPI() async {
    final api = RecipeDaoApi();
    final result = await api.getRecipes();
    log(result.toString());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeScope(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recipes", style: theme.textTheme.headlineLarge),
                IconButton(onPressed: _testAPI, icon: Icon(Icons.settings)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
