import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'screens/tabs_screen.dart';
import 'package:meals_app/screens/category_meals_screens.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import './models/meal.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
 
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> _filters = {
    "gluten":false,
    "vegetarian":false,
    "lactose":false,
    "vegan":false,

  };
  
  List<Meal> _availableMeals= DUMMY_MEALS;
  List<Meal> _favouriteMeals=[];


  void _setFilters(Map <String, bool>filterData){
      setState(() {
        _filters=filterData;
        _availableMeals=DUMMY_MEALS.where((meal){
           if(_filters["gluten"] && !meal.isGlutenFree){
             return false;
           }
            if(_filters["lactose"] && !meal.isLactoseFree){
             return false;
           }
            if(_filters["vegan"] && !meal.isVegan){
             return false;
           }
            if(_filters["vegetarian"] && !meal.isVegetarian){
             return false;
           }
           return true;
        }).toList();
      });
  }

  void _toggleFavourite(String mealId){
      final  existingIndex= _favouriteMeals.indexWhere((meal) => meal.id == mealId);
       if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

 bool _isMealFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeals",
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        
        primarySwatch: Colors.green,
        accentColor: Colors.cyanAccent, 
        canvasColor: Color.fromRGBO(255,254,229,1),
     
      ),
      //home:CategoriesScreens(),
   
      routes:{
        "/":(ctx)=>TabsScreen(_favouriteMeals),
        CategoryMealsScreens.routeName:(ctx)=> CategoryMealsScreens(_availableMeals),
        MealDetailScreen.routeName:(ctx)=>MealDetailScreen(_toggleFavourite,_isMealFavourite),
        FilterScreen.routeName:(ctx)=>FilterScreen(_setFilters,_filters),
      },
      // onGenerateRoute: (settings) {
        //this provides a default route, if the clicked route is not found
      // },
     
     
      //  onUnknownRoute:(settings){
      //    return MaterialPageRoute(builder: (ctx)=> CategoriesScreens());
      //  } , //this is used by flutter only when it is unable to find the route or onGenerateRoute
             // so that the app doesnot crash and atleast shows something oon the screen

    );
  }
}
