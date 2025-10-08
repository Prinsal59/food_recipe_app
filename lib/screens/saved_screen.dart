import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Saved'),
        backgroundColor: Colors.orange.shade700,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(title: Text('Chocolate Chip Cookies')),
          ListTile(title: Text('Tiramisu')),
        ],
      ),
    );
  }
}
