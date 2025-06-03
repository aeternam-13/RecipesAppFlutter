import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipes_app/di/dependency_injection.dart';
import 'package:recipes_app/feature_recipes/presentation/recipes/recipes_bloc.dart';
import 'package:recipes_app/feature_recipes/presentation/recipes/recipes_screen.dart';

void main() {
  initServices();
  runApp(const RecipesApp());
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (_) => sl<RecipesBloc>())],
        child: const RecipesScreen(),
      ),
    );
  }
}
