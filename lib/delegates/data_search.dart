import 'package:flutter/material.dart';
import 'package:receitas/model/recipe_mode.dart';

class DataSearch extends SearchDelegate<RecipeModel>{

  final List<RecipeModel> recipe;
  DataSearch(this.recipe);
  List<RecipeModel> filter = [];


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: (){
          Navigator.pop(context);
        },
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    //Future.delayed(Duration.zero).then((_) => close(context, recipe.first));
    close(context, recipe.first);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //final myList = RecipeModel();
    if(query.isEmpty){
      return Container();
    }
    else{
      filter = recipe.where((element){
        return element.title!.toLowerCase().contains(query.trim().toLowerCase());
      }).toList();
      return ListView.builder(
        itemCount: filter.length,
        itemBuilder: (_, index){
          return ListTile(
            title: Text(filter[index].title.toString()),
            leading: Icon(Icons.visibility),
            onTap: (){
              close(context, filter[index]);
            },
          );
        },
      );
    }
  }



}