import 'package:flutter/material.dart';
import 'package:myrestaurant/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = "/filter-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MainDrawer(),
    );
  }
}
