import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screens.dart';



//since we cannot use that dummy items directly into the list of widgets as they are not widgets they are data(alternative way is to map the list of data into the list of widgets); we need to convert the data into widgets, i.e what we are doing here
// we are creating a widget then we'll merge the data into this widget


class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(this.title, this.color,this.id);

  void selectCategory(BuildContext ctx){
      Navigator.of(ctx).pushNamed(
           CategoryMealsScreens.routeName,
           arguments: {
             "id":id,
             "title":title,
           },
        ) ;      //helps to navigate between the screens
  }

  @override
  Widget build(BuildContext context) {
    
    return InkWell( //generates waves ontap
      onTap:()=> selectCategory(context) ,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),

      child: Container(
        padding: const EdgeInsets.all(15),
        child:Text(title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[
              color.withOpacity(0.7),
              color,
            ],
             begin:Alignment.topLeft,
             end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),     
        ),
      ),
    );
  
  }
}