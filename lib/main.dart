import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/recipe_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart'; // ✅ Import splash screen
import 'package:provider/provider.dart';
import 'data/recipe_data.dart';
import 'screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
      home: const SplashScreen(),
    );
  }
}
