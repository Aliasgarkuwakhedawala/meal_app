import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meals.dart';

class favoriteMealsNotifier extends StateNotifier<List<Meal>> {
  favoriteMealsNotifier() : super([]);

  bool toggleFavoriteMeals(Meal meal) {
    final mealIsFav = state.contains(meal);
    if (mealIsFav) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<favoriteMealsNotifier, List<Meal>>((ref) {
  return favoriteMealsNotifier();
});
