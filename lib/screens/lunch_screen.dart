import 'package:flutter/material.dart';

class LunchScreen extends StatelessWidget {
  const LunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lunch'),
        backgroundColor: Colors.orange,
      ),
      body: const Center(child: Text('Lunch Recipes')),
    );
  }
}
