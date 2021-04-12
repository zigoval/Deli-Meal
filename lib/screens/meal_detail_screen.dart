import 'package:deli_meal/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail-screen';

  Widget buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.headline6.copyWith(color: Colors.black),
      ),
    );
  }

  Widget buildContainer(Widget child, double height) {
    return Container(
      height: height,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedDeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(mealId),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedDeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemCount: selectedDeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectedDeal.ingredients[index],
                    ),
                  ),
                ),
              ),
              ((selectedDeal.ingredients.length + 1) * 34).toDouble(),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              ListView.builder(
                itemCount: selectedDeal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}'),
                      ),
                      title: Text(
                        selectedDeal.steps[index],
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
              ((selectedDeal.steps.length + 1) * 50).toDouble(),
            )
          ],
        ),
      ),
    );
  }
}
