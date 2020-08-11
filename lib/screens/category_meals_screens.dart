import 'package:flutter/material.dart';

import 'package:meals_app/widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreens extends StatefulWidget {
  static const routeName = "/category-meals"; 

  final  List<Meal> availableMeals;
  CategoryMealsScreens(this.availableMeals);

  @override
  _CategoryMealsScreensState createState() => _CategoryMealsScreensState();
}

class _CategoryMealsScreensState extends State<CategoryMealsScreens> {
 
 String categoryTitle;
 List<Meal> displayedMeals;
 var _loadedInitData = false;

 @override
 void initState(){
   //...
   super.initState();
 }


 @override
 void didChangeDependencies() {
  if(!_loadedInitData) {
    final routeArgs = 
      ModalRoute.of(context).settings.arguments as Map<String,String>;
    categoryTitle = routeArgs["title"];
    final categoryId = routeArgs["id"];
    displayedMeals = widget.availableMeals.where((meal){
          return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitData= true;
 }
   super.didChangeDependencies();
   
}

  void _removeMeal(String mealId){
      setState(() {
        displayedMeals.removeWhere((meal) => meal.id == mealId);
      });
  }
 
  @override
  Widget build(BuildContext context) {

   



    return Scaffold(
     appBar:AppBar(
       title:Text(categoryTitle),
     ) ,
          body: ListView.builder(
            itemBuilder: (ctx,index){
                  return MealItem(
                    affordability:  displayedMeals[index].affordability, 
                    complexity:  displayedMeals[index].complexity,
                     duration:   displayedMeals[index].duration,
                      imageUrl:   displayedMeals[index].imageUrl,
                       title:  displayedMeals[index].title,
                       id: displayedMeals[index].id,
                
                  );
            }, itemCount: displayedMeals.length),
          );
             
          
    
  }
}