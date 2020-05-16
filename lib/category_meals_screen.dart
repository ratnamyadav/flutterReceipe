import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen({ this.categoryId, this.categoryTitle });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals for $categoryTitle'),
      ),
      body: Center(
        child: Text('The receipe of category $categoryTitle'),
      ),
    );
  }

}