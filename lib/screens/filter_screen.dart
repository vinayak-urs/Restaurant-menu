import 'package:flutter/material.dart';
import 'package:myrestaurant/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filter-screen";
  final Function savefilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.savefilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  void initState() {
    _glutenFree = widget.currentFilters["gluten"];
    _lactoseFree = widget.currentFilters["lactose"];
    _vegan = widget.currentFilters["vegan"];
    _vegetarian = widget.currentFilters["vegetarian"];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: IconButton(
              icon: Icon(
                Icons.save,
              ),
              onPressed: () {
                final selectedfilters = {
                  "gluten": _glutenFree,
                  "lactose": _lactoseFree,
                  "vegan": _vegan,
                  "vegetarian": _vegetarian,
                };
                widget.savefilters(selectedfilters);
              },
            ),
          )
        ],
        title: Center(child: Text("Filters ")),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your meal selection.",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  (newvalue) {
                    setState(() {
                      _glutenFree = newvalue;
                    });
                  },
                  title: "Gluten Free",
                  description: "This includes only Gluten Free Meals",
                  currentValue: _glutenFree,
                ),
                buildSwitchListTile(
                  (newvalue) {
                    setState(() {
                      _lactoseFree = newvalue;
                    });
                  },
                  title: "Lactose Free",
                  description: "This includes only Lactose Free Meals",
                  currentValue: _lactoseFree,
                ),
                buildSwitchListTile(
                  (newvalue) {
                    setState(() {
                      _vegan = newvalue;
                    });
                  },
                  title: "Vegan",
                  description: "This includes only vegan Meals",
                  currentValue: _vegan,
                ),
                buildSwitchListTile(
                  (newvalue) {
                    setState(() {
                      _vegetarian = newvalue;
                    });
                  },
                  title: "Vegetarian",
                  description: "This includes only vegetarian Meals",
                  currentValue: _vegetarian,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildSwitchListTile(
    Function updateValue, {
    String title,
    String description,
    bool currentValue,
  }) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }
}
