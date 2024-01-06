import 'package:flutter/material.dart';
import 'package:meal_app/main.dart';
import 'package:meal_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({
    super.key,
  });

  @override
  ConsumerState<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  bool _gluttenFilter = false;
  bool _lactosFilter = false;
  bool _vegetarianFilter = false;
  bool _veganFilter = false;

  @override
  void initState() {
    // TODO: implement initState
    final activeFilters = ref.read(filtersProvider);
    _gluttenFilter = activeFilters[Filter.gluttenFree]!;
    _lactosFilter = activeFilters[Filter.lactosFree]!;
    _vegetarianFilter = activeFilters[Filter.vegetarian]!;
    _veganFilter = activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.gluttenFree: _gluttenFilter,
            Filter.lactosFree: _lactosFilter,
            Filter.vegetarian: _vegetarianFilter,
            Filter.vegan: _veganFilter
          });
          return true;
        },
        child: Column(
          children: [
            SwitchListTile(
              contentPadding: EdgeInsets.only(right: 16, left: 26),
              activeColor: Theme.of(context).colorScheme.tertiary,
              value: _gluttenFilter,
              onChanged: (isChecked) {
                setState(() {
                  _gluttenFilter = isChecked;
                });
              },
              title: Text(
                'Glutten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
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
              value: _lactosFilter,
              onChanged: (isChecked) {
                setState(() {
                  _lactosFilter = isChecked;
                });
              },
              title: Text(
                'Lactos-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
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
              value: _vegetarianFilter,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilter = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
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
              value: _veganFilter,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilter = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
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
      ),
    );
  }
}
