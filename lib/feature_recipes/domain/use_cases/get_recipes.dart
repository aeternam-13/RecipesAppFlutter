import 'package:multiple_result/multiple_result.dart';
import 'package:recipes_app/core/errors.dart';
import 'package:recipes_app/feature_recipes/domain/model/recipe.dart';
import 'package:recipes_app/feature_recipes/domain/repository/recipe_repository.dart';

class GetRecipes {
  final RecipeRepository repository;

  GetRecipes(this.repository);

  Future<Result<List<Recipe>, RecipesException>> call(bool reload) async {
    return await repository.getRecipes(reload);
  }
}
