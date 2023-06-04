import 'package:flutter/material.dart';
import 'package:meals/widgets/filter_tile.dart';
// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _veganFilter = false;
  bool _vegetarianFilter = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilter = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilter = widget.currentFilters[Filter.lactoseFree]!;
    _veganFilter = widget.currentFilters[Filter.vegan]!;
    _vegetarianFilter = widget.currentFilters[Filter.vegetarian]!;
  }

  void _toggleGlutenFreeFilter(bool isChecked) {
    setState(() {
      _glutenFreeFilter = isChecked;
    });
  }

  void _toggleLactoseFreeFilter(bool isChecked) {
    setState(() {
      _lactoseFreeFilter = isChecked;
    });
  }

  void _toggleVeganFilter(bool isChecked) {
    setState(() {
      _veganFilter = isChecked;
    });
  }

  void _toggleVegetarianFilter(bool isChecked) {
    setState(() {
      _vegetarianFilter = isChecked;
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, {
            Filter.glutenFree: _glutenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegan: _veganFilter,
            Filter.vegetarian: _vegetarianFilter,
          });
          return false;
        },
        child: Column(
          children: [
            FilterTile(
              value: _glutenFreeFilter,
              onChangedFunc: _toggleGlutenFreeFilter,
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals.',
            ),
            FilterTile(
              value: _lactoseFreeFilter,
              onChangedFunc: _toggleLactoseFreeFilter,
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals.',
            ),
            FilterTile(
              value: _veganFilter,
              onChangedFunc: _toggleVeganFilter,
              title: 'Vegan',
              subtitle: 'Only include vegan meals.',
            ),
            FilterTile(
              value: _vegetarianFilter,
              onChangedFunc: _toggleVegetarianFilter,
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals.',
            ),
          ],
        ),
      ),
    );
  }
}
