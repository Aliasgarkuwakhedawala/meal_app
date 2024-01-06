import 'package:flutter/material.dart';
import 'package:meal_app/providers/favorite_meal_provider.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/side_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/meals_provider.dart';
import 'package:meal_app/providers/favorite_meal_provider.dart';
import 'package:meal_app/providers/filters_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  var _currentindex = 0;

  void _setDrawerScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
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
    final Meals = ref.watch(meals);
    final activeFilters = ref.watch(filtersProvider);
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget content = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var _currentTitle = 'Choose Your Category';

    if (_currentindex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      content = MealsScreen(
        meals: favoriteMeals,
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
