import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipes_app/di/dependency_injection.dart';
import 'package:recipes_app/feature_recipes/presentation/recipes/recipes_bloc.dart';
import 'package:recipes_app/feature_recipes/presentation/recipes/recipes_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// get_it dependencies
  initServices();

  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Hive.openBox<Set<String>>('favoritesBox');
  runApp(const RecipesApp());
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 20, 134, 255),
        ),
      ),
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (_) => sl<RecipesBloc>())],
        child: const RecipesScreen(),
      ),
    );
  }
}
