import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filters";

  final Function saveFilters;
  final Map<String,bool> currentFilters;
  FilterScreen(this.saveFilters,this.currentFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  bool _glutenFree = false;
  bool _vegetarian= false;
  bool _vegan= false;
   bool _lactoseFree= false;
  
  @override
  void initState() {
     _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

   





  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: Text("YourFilter"),
           actions: [
             IconButton(
               icon: Icon(Icons.save),
                onPressed:(){ 
               final selectedFilters = {
                   'gluten': _glutenFree,
                   'lactose': _lactoseFree,
                   'vegan': _vegan,
                   'vegetarian': _vegetarian,

               };

              widget.saveFilters(selectedFilters);
               },
            )
           ],
         ),
         drawer:MainDrawer(),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child:Text("Adjust Your Meal Selection"),
              ),
              Expanded(
                child: ListView(
                  children: [
                    SwitchListTile(
                      title:Text("Gluten-Free"),
                      value: _glutenFree,
                      subtitle: Text("Only gluten-free meals"),
                      onChanged: (newValue){
                        setState(() {
                          _glutenFree= newValue;
                        });
                      }
                      ),

                      SwitchListTile(
                      title:Text("Vegetarian"),
                      value: _vegetarian,
                      subtitle: Text("Only Vegetarian meals"),
                      onChanged: (newValue){
                        setState(() {
                          _vegetarian= newValue;
                        });
                      }
                      ),

                      SwitchListTile(
                      title:Text("Vegan-Free"),
                      value: _vegan,
                      subtitle: Text("Only vegan-free meals"),
                      onChanged: (newValue){
                        setState(() {
                          _vegan= newValue;
                        });
                      }
                      ),

                      SwitchListTile(
                      title:Text("Lactose-Free"),
                      value: _lactoseFree,
                      subtitle: Text("Only lactose-free meals"),
                      onChanged: (newValue){
                        setState(() {
                          _lactoseFree= newValue;
                        });
                      }
                      ),
                  ],
                ),),
            ],
          ),
        );
    
  }
}