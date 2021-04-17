import 'package:flutter/material.dart';
import 'package:myrestaurant/dummy_data.dart';
import 'package:myrestaurant/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-details";

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeals = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text("${selectedMeals.title}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeals.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildContainerTitle(
                context,
                "Ingredients",
              ),
              buildContainer(
                context,
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Center(child: Text(selectedMeals.ingredients[index])),
                    ),
                  ),
                  itemCount: selectedMeals.ingredients.length,
                ),
              ),
              buildContainerTitle(context, "Steps"),
              buildContainer(
                context,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.pinkAccent,
                        child: Text("#${index + 1}"),
                      ),
                      title: Text(selectedMeals.steps[index]),
                    );
                  },
                  itemCount: selectedMeals.steps.length,
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ));
  }

  Widget buildContainer(BuildContext context, {Widget child}) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(horizontal: 30),
        height: 200,
        width: MediaQuery.of(context).size.width * 0.8,
        child: child);
  }

  Widget buildContainerTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
