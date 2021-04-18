import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorite_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabScreen(this.favoriteMeals);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> pages;

  initState() {
    pages = [
      {
        "page": CategoriesScreen(),
        "title": "Categories",
      },
      {
        "page": FavoriteScreen(widget.favoriteMeals),
        "title": "Favorites",
      }
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(
      () {
        _selectedPageIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_selectedPageIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              // color: Colors.white,
            ),
            title: Text("Favorite"),
          ),
        ],
      ),
    );
  }
}
