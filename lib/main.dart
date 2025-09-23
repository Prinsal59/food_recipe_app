import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/recipe_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart'; // ✅ Import splash screen
import 'package:provider/provider.dart';
import 'data/recipe_data.dart'; // (or RecipeProvider if you’re using state management)

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => RecipeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  prinsal kotadiya 
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      ),
      home: const SplashScreen(), // ✅ Start at splash screen
    );
  }
}
