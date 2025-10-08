import 'package:flutter/material.dart';
import 'package:food_recipe_app/screens/home_screen.dart';

void main() {
  runApp(const FoodRecipeApp());
}

class FoodRecipeApp extends StatelessWidget {
  const FoodRecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Food Recipe App', home: HomeScreen());
  }
}
