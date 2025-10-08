import 'package:flutter/material.dart';

class BreakfastScreen extends StatelessWidget {
  const BreakfastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breakfast'),
        backgroundColor: Colors.orange,
      ),
      body: const Center(child: Text('Breakfast Recipes')),
    );
  }
}
