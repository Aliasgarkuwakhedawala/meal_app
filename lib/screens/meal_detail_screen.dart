import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(
      {super.key, required this.meal, required this.onToggleFav});

  final Meal meal;
  final Function(Meal meal) onToggleFav;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFav(meal);
            },
            icon: Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              width: double.infinity,
              fit: BoxFit.cover,
              height: 300,
              image: NetworkImage(meal.imageUrl),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Ingridients',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            for (String ingridient in meal.ingredients)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: Text(
                  ingridient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Steps',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            for (String step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 4,
                ),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
