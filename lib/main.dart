import 'package:flutter/material.dart';
import 'package:myrestaurant/screens/categories_screen.dart';
import 'package:myrestaurant/screens/category_meals_screen.dart';
import 'package:myrestaurant/screens/meal_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          accentColor: Colors.amber,
          primarySwatch: Colors.pink,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                // ignore: deprecated_member_use
                // caption: TextStyle(
                //   fontSize: 20,
                // ),
              )),
      home: Homepage(),
      routes: {
        // "/": (ctx) => Homepage(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Meals",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              )),
        ),
      ),
      body: CategoriesScreen(),
    );
  }
}
