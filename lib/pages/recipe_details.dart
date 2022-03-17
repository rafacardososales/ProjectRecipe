import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receitas/model/recipe_mode.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class RecipeDetails extends StatelessWidget {

  final RecipeModel recipeModel;
  RecipeDetails({
    required this.recipeModel
  });


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SlidingUpPanel(
        minHeight: (size.height / 2),
        maxHeight: (size.height / 1.2),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24)
        ),
        parallaxEnabled: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: recipeModel.imgPath!,
                  child: Image(
                    height: (size.height / 2) +50,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: true? NetworkImage('${recipeModel.imgPath}') : CircularProgressIndicator() as ImageProvider,
                  ),
                ),
              ),
              const Positioned(
                top: 40,
                right: 20,
                child: Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                  size: 38,
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: InkWell(
                  onTap: ()=> Navigator.pop(context),
                  child: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 38,
                  ),
                ),
              )
            ],
          ),
        ),
        panel: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 40,
                  decoration:  BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12)
                  ),
                ),
              ),
              const SizedBox(height: 30.0,),
              Text(recipeModel.title!,
                style: _textTheme.headline6,
              ),
              const SizedBox(height: 10.0,),
              Text(recipeModel.category!,
                style: _textTheme.caption,
              ),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  const Icon(Icons.favorite_outlined,
                  color: Colors.red,
                  ),
                  const SizedBox(width: 5,),
                  Text('198'),
                  const SizedBox(width: 5,),
                  const Icon(Icons.timer_sharp,
                  ),
                  const SizedBox(width: 5,),
                  Text(recipeModel.cookingTime!),
                  const SizedBox(width: 20,),
                  Container(
                    color: Colors.black,
                    height: 30,
                    width: 2,
                  ),
                  const SizedBox(width: 10,),
                  Text(recipeModel.servings!.toString() + ' Pessoas'),
                ],
              ),
              const SizedBox(height: 10,),
              Divider(
                color: Colors.black.withOpacity(0.3),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: Colors.black,
                        indicator: DotIndicator(
                          color: Colors.red,
                          distanceFromCenter: 16,
                          radius: 3,
                          paintingStyle: PaintingStyle.fill
                        ),
                        unselectedLabelColor: Colors.black.withOpacity(0.3),
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                        ),
                        //labelPadding: EdgeInsets.symmetric(horizontal: 32),
                        tabs: [
                          Tab(
                            text: "Ingredientes".toUpperCase(),
                          ),
                          Tab(
                            text: "Preparo".toUpperCase(),
                          ),
                          Tab(
                            text: "Descrição".toUpperCase(),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Ingredientes(recipemodel: recipeModel,),
                            Preparo(recipemodel: recipeModel,),
                            Sobre(recipemodel: recipeModel,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class Ingredientes extends StatelessWidget {
  final RecipeModel recipemodel;
  Ingredientes({required this.recipemodel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: recipemodel.ingredients.length,
            separatorBuilder: (BuildContext context, int index){
              return Divider(
                color: Colors.black.withOpacity(0.3),
              );
            },
            itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('⚫  ' + recipemodel.ingredients[index]),
              );
            },
          )
        ],
      ),
    );
  }
}






class Preparo extends StatelessWidget {
  final RecipeModel recipemodel;
  Preparo({ required this.recipemodel});

@override
Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        ListView.separated(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: recipemodel.preparation.length,
          separatorBuilder: (BuildContext context, int index){
            return Divider(
              color: Colors.black.withOpacity(0.3),
            );
          },
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(recipemodel.preparation[index]),
            );
          },
        )
      ],
    ),
  );
}
}






class Sobre extends StatelessWidget {
  final RecipeModel recipemodel;
  Sobre({ required this.recipemodel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(recipemodel.description.toString()),
          )
        ],
      ),
    );
  }
}


