import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  const RecipeCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/food_placeholder.png',
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: const Text(
          '⭐ 4.8   ⏱ 10 min',
          style: TextStyle(color: Colors.grey),
        ),
        trailing: const Icon(Icons.favorite_border, color: Colors.white),
      ),
    );
  }
}
