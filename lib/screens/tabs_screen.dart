import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/side_drawer.dart';

const kInitialFilter = {
  Filter.gluttenFree: false,
  Filter.lactosFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> _favouriteMeals = [];
  Map<Filter, bool> _selectedFilter = kInitialFilter;

  var _currentindex = 0;

  void _setDrawerScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      var result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(selectedFilters: _selectedFilter),
        ),
      );

      setState(() {
        _selectedFilter = result ?? kInitialFilter;
      });
    }
  }

  void _toggleFavMeals(Meal meal) {
    final isExist = _favouriteMeals.contains(meal);
    if (isExist) {
      setState(() {
        _favouriteMeals.remove(meal);
      });
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Meal is no longer Favourite"),
        ),
      );
    } else {
      setState(() {
        _favouriteMeals.add(meal);
      });
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Meal is Added to Favourite"),
        ),
      );
    }
  }

  void _selectTab(index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilter[Filter.gluttenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[Filter.lactosFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget content = CategoriesScreen(
      onToggleFav: _toggleFavMeals,
      availableMeals: availableMeals,
    );
    var _currentTitle = 'Choose Your Category';

    if (_currentindex == 1) {
      content = MealsScreen(
        meals: _favouriteMeals,
        onToggleFav: _toggleFavMeals,
      );
      _currentTitle = 'Your Favourite';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_currentTitle),
      ),
      drawer: SideDrewer(selectScreen: _setDrawerScreen),
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectTab(index);
        },
        currentIndex: _currentindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourite'),
        ],
      ),
    );
  }
}
