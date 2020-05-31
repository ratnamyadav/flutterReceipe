import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  /*final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen({ this.categoryId, this.categoryTitle });*/

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) => meal.categories.contains(categoryId)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        }, itemCount: categoryMeals.length, ),
      ),
    );
  }

}