import 'package:flutter/foundation.dart';
import '../models/recipe.dart';
import 'recipe_data.dart';

class RecipeProvider extends ChangeNotifier {
  final List<Recipe> _recipes = recipes;

  List<Recipe> get allRecipes => _recipes;

  get filteredRecipes => null;

  get selectedCategory => null;

  List<Recipe> getByCategory(String category) {
    if (category == "All") return _recipes;
    return _recipes.where((r) => r.category == category).toList();
  }

  void setCategory(String categori) {}
}
