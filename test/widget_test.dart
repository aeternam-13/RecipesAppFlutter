import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipes_app/feature_recipes/data/data_source/recipe_dao_api.dart';
import 'package:recipes_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const RecipesApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  test('API call', () async {
    RecipeDaoImpl recipeDaoApi = RecipeDaoImpl();

    await recipeDaoApi.getRecipes(true);
  });

  test('Api small test', () async {
    // final url = Uri.parse(
    //   'https://www.themealdb.com/api/json/v1/1/search.php?f=a',
    // );
    //final response = await http.get(url);
  });
}
