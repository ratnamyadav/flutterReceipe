import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static final String routeName = '/meal-detail-screen';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget buildContainer(BuildContext context, List<String> elements) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)
      ),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10
                ),
                child: Text(elements[index])
            ),
          );
        },
        itemCount: elements.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, Meal>;

    final selectedMeal = routeArgs['meal'];
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(context, selectedMeal.ingredients),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(context, selectedMeal.steps),
          ],
        ),
      ),
    );
  }
  
}