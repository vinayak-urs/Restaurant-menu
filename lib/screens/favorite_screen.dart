import 'package:flutter/material.dart';

import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;
  FavoriteScreen(this.favoriteMeal);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     // title: Text("Favorites"),
      //     ),
      body: Center(child: Text("No Favorites Yet Selected !")),
    );
  }
}
