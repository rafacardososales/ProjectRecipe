import 'package:flutter/material.dart';
import 'package:receitas/delegates/data_search.dart';
import 'package:receitas/model/recipe_mode.dart';
import 'package:receitas/pages/new_recipe.dart';
import 'package:receitas/pages/recipe_categories.dart';
import 'package:receitas/widgets/popular_recipe.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final RecipeModel recipe;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Receitas"),
        centerTitle: true,
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 12),
              icon: const Icon(Icons.search),
              onPressed: () {
                Future<RecipeModel?> result = showSearch(
                    context: context,
                    delegate: DataSearch(RecipeModel.avesRecipe));
                print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa $result');
              },
              iconSize: 30,
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        //color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(Icons.home,
            color: Colors.blue,
            ),
            Icon(Icons.groups_outlined,
              //color: Colors.blue,
            ),
            Icon(Icons.favorite_outline_rounded,
              //color: Colors.blue,
            ),
            Icon(Icons.account_circle_outlined,
              //color: Colors.blue,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Column(
            children: [
              const SizedBox(height: 20,),
              TabBar(
                tabs: [
                  Tab(text: 'Novas Receitas'.toUpperCase()),
                  Tab(text: 'Favoritas'.toUpperCase()),
                  Tab(text: 'Categorias'.toUpperCase())
                ],
                labelColor: Colors.black,
                //padding: EdgeInsets.only(left: 15),
                isScrollable: true,
                indicator: DotIndicator(
                  color: Colors.black,
                  distanceFromCenter: 16,
                  radius: 3,
                  paintingStyle: PaintingStyle.fill
                ),
                unselectedLabelColor: Colors.black.withOpacity(0.3),
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: 24
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    const NewRecipe(),
                    Container(
                      child: const Center(
                        child: Text('Favoritas'),
                      ),
                    ),
                    const RecipeCategories(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
