import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });
  final String? title;
  final List<Meal> meals;
  @override
  Widget build(context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh... No meals in this category',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try choosing another category',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (cnt, index) => MealItem(
          meal: meals[index],
        ),
      );
    }
    if (title != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content,
      );
    }
    return Scaffold(
      body: content,
    );
  }
}
