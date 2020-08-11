import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";


  final Function toggleFavourite;
  final Function isFavourite;
  

  MealDetailScreen(this.toggleFavourite,this.isFavourite);

  Widget buildSectionTitle(BuildContext context,String text){
          return  Container(
               margin:EdgeInsets.symmetric(vertical:10),
               child:Text(
                 text,
                 style: TextStyle(
                   fontSize: 24,
                   fontWeight: FontWeight.bold,
                 ),
                 ),
             );
  }

  Widget buildContainer(Widget child){
       return Container(
               decoration: BoxDecoration(
                 color:Colors.white,
                 border:Border.all(
                   color:Colors.grey
                 ),
                 borderRadius: BorderRadius.circular(10),
                ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
               height: 150,
               width: 300,
               child:child,
        );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title:Text("${selectMeal.title}"),
        ),
          body: SingleChildScrollView(
                      child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child:Image.network(
                    selectMeal.imageUrl,
                     fit:BoxFit.cover,
                  ),
                ),
             buildSectionTitle(context, "Ingredients"),
             
               buildContainer(
                  ListView.builder(
                   itemBuilder:(ctx,index)=> Card(
                      color:  Theme.of(context).accentColor,
                     child:Padding(
                       padding: EdgeInsets.symmetric(
                         vertical: 5,
                         horizontal: 10,
                       ),
                       child: Text(selectMeal.ingredients[index],
                       ),
                     ),
                   ),
                  itemCount:selectMeal.ingredients.length,
                 ) ,

               ),
               buildSectionTitle(context, "Steps"),
               buildContainer(ListView.builder(
                 itemCount: selectMeal.steps.length,
                 itemBuilder: (ctx,index)=>Column(
                   children: [
                     ListTile(
                       leading: CircleAvatar(
                         child: Text("# ${(index+1)}")
                       ),
                       title:Text(selectMeal.steps[index],),
                     ),
                     Divider(),
                   ], 
                 ),
                 ),

                ),

              ],
            ),
          ),
         
         
          floatingActionButton:FloatingActionButton(
            onPressed: ()=>toggleFavourite(mealId),
            child:Icon(isFavourite(mealId) ? Icons.star  :Icons.star_border,
            ),
          ),
        );
    
  }
}