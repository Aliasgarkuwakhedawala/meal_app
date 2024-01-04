import 'package:flutter/material.dart';

class SideDrewer extends StatelessWidget {
  const SideDrewer({super.key, required this.selectScreen});

  final void Function(String identifier) selectScreen;

  @override
  Widget build(context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onPrimary,
                  Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.dining_outlined,
                  size: 48,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.lunch_dining,
              size: 26,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 22),
            ),
            onTap: () {
              selectScreen('meals');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 26,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 22),
            ),
            onTap: () {
              selectScreen('filters');
            },
          )
        ],
      ),
    );
  }
}
