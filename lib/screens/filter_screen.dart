import 'package:flutter/material.dart';
import 'package:meal_app/main.dart';
import 'package:meal_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
  });

  @override
  Widget build(context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            contentPadding: EdgeInsets.only(right: 16, left: 26),
            activeColor: Theme.of(context).colorScheme.tertiary,
            value: activeFilters[Filter.gluttenFree]!,
            onChanged: (isChecked) {
              ref
                  .watch(filtersProvider.notifier)
                  .setFilter(Filter.gluttenFree, isChecked);
            },
            title: Text(
              'Glutten-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Select the meal which is Glutten-Free!',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.only(right: 16, left: 26),
            activeColor: Theme.of(context).colorScheme.tertiary,
            value: activeFilters[Filter.lactosFree]!,
            onChanged: (isChecked) {
              ref
                  .watch(filtersProvider.notifier)
                  .setFilter(Filter.lactosFree, isChecked);
            },
            title: Text(
              'Lactos-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Select the meal which is Lactos-Free!',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.only(right: 16, left: 26),
            activeColor: Theme.of(context).colorScheme.tertiary,
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .watch(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Select the meal which is Vegetarian!',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.only(right: 16, left: 26),
            activeColor: Theme.of(context).colorScheme.tertiary,
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .watch(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Select the meal which is Vegan!',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
