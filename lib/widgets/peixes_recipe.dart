import 'package:flutter/material.dart';
import 'package:receitas/model/recipe_mode.dart';
import 'package:receitas/pages/recipe_details.dart';



Widget recipePeixes(){
  return Container(
    //color: Colors.orange,
    height: 245,
    child:
    ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: RecipeModel.peixesRecipe.length,
      itemBuilder: (BuildContext context, int index){
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 12.0
          ),
          child: GestureDetector(
              onTap: ()=> Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=>
                      RecipeDetails(
                        recipeModel: RecipeModel.peixesRecipe[index],
                      ),
                ),
              ),
              child: RecipeCard(RecipeModel.peixesRecipe[index])
          ),
        );
      },
    ),
  );
}

class RecipeCard extends StatefulWidget {

  final RecipeModel recipeModel;
  RecipeCard(
      @required this.recipeModel
      );

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {

  bool saved = false;
  bool loved = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Hero(
                  tag: widget.recipeModel.imgPath!,
                  child: Image(
                    height: 210,
                    width: 220,
                    fit: BoxFit.cover,
                    image: NetworkImage('${widget.recipeModel.imgPath}'),
                  ),
                ),
              ),
            ),
            // Positioned(
            //   top: 20,
            //   right: 40,
            //   child: InkWell(
            //     onTap: (){
            //       setState(() {
            //         saved = !saved;
            //       });
            //     },
            //     child: Icon(
            //       saved
            //           ? Icons.bookmark_added
            //           : Icons.bookmark_border,
            //       color: Colors.white,
            //       size: 38,
            //     ),
            //   ),
            // )
          ],
        ),
        const SizedBox(height: 10,),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 24.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Flexible(
        //         flex: 2,
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               widget.recipeModel.title!,
        //               style: Theme.of(context).textTheme.subtitle1,
        //             ),
        //             SizedBox(height: 8.0,),
        //             Text(
        //               widget.recipeModel.category!,
        //               style: Theme.of(context).textTheme.caption,
        //             ),
        //           ],
        //         ),
        //       ),
        //       Flexible(
        //         flex: 1,
        //         child: Row(
        //           children: [
        //             const SizedBox(width: 5.0,),
        //             const Icon(Icons.timer_sharp),
        //             const SizedBox(width: 4.0,),
        //             Text(widget.recipeModel.cookingTime!),
        //             Spacer(),
        //             InkWell(
        //               onTap: (){
        //                 setState(() {
        //                   loved = !loved;
        //                 });
        //               },
        //               child: Icon(
        //                   Icons.favorite_outlined ,
        //                   color:  loved ? Colors.red : Colors.black
        //               ),
        //             )
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        // )
      ],
    );
  }
}