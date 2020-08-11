import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreens extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return  GridView( 
            padding: const EdgeInsets.all(25),
        children:
           DUMMY_CATEGORIES
           .map((catData)=> CategoryItem(
             catData.title,
             catData.color,
             catData.id, 
          )).toList(),
        


        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3/2, //300 height
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
   
   
      ),  
  
   );
    

//gridview means side by side
//sliver means grid is scrollable like listview
//grid delegate means giving structure or layout to gridview
//maxcrossaxisextent allows to define maxwidth for the grids, so they adjust accordingly
 
 
  }
}

