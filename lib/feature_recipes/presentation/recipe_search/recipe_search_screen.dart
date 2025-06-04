import 'package:flutter/material.dart';
import 'package:recipes_app/core/safe_scope.dart';

class RecipeSearchScreen extends StatefulWidget {
  const RecipeSearchScreen({super.key});

  @override
  State<RecipeSearchScreen> createState() => _RecipeSearchScreenState();
}

class _RecipeSearchScreenState extends State<RecipeSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeScope(
      appBar: AppBar(
        title: Text("Search recipes"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: TextFormField(
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
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 32,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
