import 'package:get_it/get_it.dart';
import 'package:recipes_app/feature_recipes/data/data_source/recipe_dao.dart';
import 'package:recipes_app/feature_recipes/data/data_source/recipe_dao_api.dart';
import 'package:recipes_app/feature_recipes/data/repository/recipe_repository_impl.dart';
import 'package:recipes_app/feature_recipes/domain/repository/recipe_repository.dart';
import 'package:recipes_app/feature_recipes/domain/use_cases/add_to_favorites.dart';
import 'package:recipes_app/feature_recipes/domain/use_cases/get_recipes.dart';
import 'package:recipes_app/feature_recipes/domain/use_cases/use_cases.dart';
import 'package:recipes_app/feature_recipes/presentation/recipes/recipes_bloc.dart';

final sl = GetIt.instance;

void initServices() {
  sl.registerLazySingleton<RecipeDao>(() => RecipeDaoApi());

  sl.registerLazySingleton<RecipeRepository>(() => RecipeRepositoryImpl(sl()));

  sl.registerLazySingleton(
    () => RecipeUseCases(
      getRecipes: GetRecipes(sl()),
      addToFavorites: AddToFavorites(sl()),
      // saveRecipe: SaveRecipe(sl()),
      // deleteRecipe: DeleteRecipe(sl()),
    ),
  );

  sl.registerFactory(() => RecipesBloc(sl()));
}
