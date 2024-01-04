import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
