import 'package:flutter/material.dart';

class DessertScreen extends StatelessWidget {
  const DessertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dessert'),
        backgroundColor: Colors.orange,
      ),
      body: const Center(child: Text('Dessert Recipes')),
    );
  }
}
