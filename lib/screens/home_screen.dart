import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/recipe_provider.dart';
import '../widgets/recipe_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    final categories = ["All", "Breakfast", "Lunch", "Dinner", "Dessert"];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Top Greeting
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hello Divya 👋",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Welcome back!",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                  ),
                ],
              ),
            ),

            // 🔹 Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.orange.shade400,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 🔹 Category Tabs
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected =
                      recipeProvider.selectedCategory == categories[index];
                  return GestureDetector(
                    onTap: () {
                      recipeProvider.setCategory(categories[index]);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.orange : Colors.grey[800],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // 🔹 Featured Recipes Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Featured Recipes",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // 🔹 Recipe List
            Expanded(
              child: ListView.builder(
                itemCount: recipeProvider.filteredRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipeProvider.filteredRecipes[index];
                  return RecipeCard(recipe: recipe);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
