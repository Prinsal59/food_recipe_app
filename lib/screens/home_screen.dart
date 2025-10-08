import 'package:flutter/material.dart';

// Import all your category screens here
import 'package:food_recipe_app/screens/breakfast_screen.dart';
import 'package:food_recipe_app/screens/lunch_screen.dart';
import 'package:food_recipe_app/screens/dinner_screen.dart';
import 'package:food_recipe_app/screens/dessert_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Function to build tab buttons
  Widget _buildTabButton(BuildContext context, String title, Widget screen) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Recipe App"),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Row of buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabButton(context, 'Breakfast', BreakfastScreen()),
                _buildTabButton(context, 'Lunch', LunchScreen()),
                _buildTabButton(context, 'Dinner', DinnerScreen()),
                _buildTabButton(context, 'Dessert', DessertScreen()),
              ],
            ),

            const SizedBox(height: 24),

            const Expanded(
              child: Center(
                child: Text(
                  'Home content goes here',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Saved"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
