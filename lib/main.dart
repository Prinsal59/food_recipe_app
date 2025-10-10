import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'package:food_recipe_app/screens/login_screen.dart';
import 'screens/saved_screen.dart';
import 'package:food_recipe_app/screens/dessert_screen.dart';
import 'package:food_recipe_app/screens/ingredients_screen.dart';
import 'screens/notification_screen.dart';

void main() {
  runApp(const FoodRecipeApp());
}

class FoodRecipeApp extends StatelessWidget {
  const FoodRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Recipe App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const SplashScreen(),
    );
  }
}
