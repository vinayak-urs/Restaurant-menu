import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-details";

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("This is meal details page ${mealId}"),
        ),
      ),
    );
  }
}
