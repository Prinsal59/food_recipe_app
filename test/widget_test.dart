import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe_app/main.dart';

void main() {
  testWidgets('App starts and shows HomeScreen', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const FoodRecipeApp());

    // Verify title text exists
    expect(find.text('Hello Divya 👋'), findsOneWidget);
  });
}
