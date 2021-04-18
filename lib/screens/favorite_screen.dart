import 'package:flutter/material.dart';
import 'package:myrestaurant/widgets/meal_item.dart';

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
      body: favoriteMeal.isEmpty
          ? Center(child: Text("No Favorites Yet Selected !"))
          : ListView.builder(
              itemBuilder: (context, index) {
                return MealItem(
                  id: favoriteMeal[index].id,
                  affordability: favoriteMeal[index].affordability,
                  complexity: favoriteMeal[index].complexity,
                  duration: favoriteMeal[index].duration,
                  imageUrl: favoriteMeal[index].imageUrl,
                  title: favoriteMeal[index].title,
                );
              },
              itemCount: favoriteMeal.length,
            ),
    );
  }
}
