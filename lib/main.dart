import 'package:deli_meal/screens/categories_screen.dart';
import 'package:deli_meal/screens/category_meals_screen.dart';
import 'package:deli_meal/screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
      ),
      //home: CategoriesScreen(),
      //initielRoute: '/', // it's default but it could be anypage
      routes: {
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen()
      },
      // onGenerateRoute: (settings){
      //   print(settings.arguments
      //   );
      //   return MaterialPageRoute(builder: (ctx)=> CategoriesScreen())
      // },
      onUnknownRoute: (settings) {
        //404
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
