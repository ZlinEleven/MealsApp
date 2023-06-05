import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });

  void setFilter(Filter filter, bool isSet) {
    state = {
      ...state,
      filter: isSet,
    };
  }

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
  return FiltersNotifier();
});

final filteredMealsProvider = Provider((ref) {
  final availableMeals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return availableMeals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    } else if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    } else if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    } else if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    } else {
      return true;
    }
  }).toList();
});
