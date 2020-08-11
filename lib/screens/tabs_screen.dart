import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screens.dart';
import 'package:meals_app/screens/favourites_screens.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal>favouriteMeals;
   
   TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //final List<Widgets> _pages = [
   //CategoriesScreen(), FavouriteScreens()
  //];
  //int _selectedPageIndex = 0;
  //void selectPage(int index){
          //_selectedPageIndex = index;
  //}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
    //  initialIndex: 0/1,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
          bottom: TabBar(tabs:<Widget>[
             Tab(
               icon:Icon(Icons.category),
               text: "Category",
             ),
             Tab(
               icon:Icon(Icons.favorite
               ),
               text: "Favourites",
             ),
          ],
         ),
        ),
        drawer:MainDrawer(),
        body: TabBarView(
          children: [
            CategoriesScreens(), 
            FavouritesScreens(widget.favouriteMeals),
          ]
        ),
      ), 
    );
  }
}


//body: _pages[_selectedPageIndex]
// BottomNavigationBar:BottomNavigationBar(
// onTap: _selectPage, 
//   backgroudColor:Theme.of(context).primaryColor,
//   items:[
//     BottomNavigationBarItem(
//       icon: Icon(Icons.category),title:Text("Category")
//       ),
//      BottomNavigationBarItem(
//       icon: Icon(Icons.favorite),title:Text("Favourite")
//       ),  
//   ]
// )