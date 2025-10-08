import 'package:flutter/material.dart';

class DinnerScreen extends StatelessWidget {
  const DinnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dinner'),
        backgroundColor: Colors.orange,
      ),
      body: const Center(child: Text('Dinner Recipes')),
    );
  }
}
