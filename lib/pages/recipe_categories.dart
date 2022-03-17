import 'package:flutter/material.dart';
import 'package:receitas/widgets/aves_recipe.dart';
import 'package:receitas/widgets/bebidas_recipe.dart';
import 'package:receitas/widgets/bolos_tortas_recipe.dart';
import 'package:receitas/widgets/carnes_recipe.dart';
import 'package:receitas/widgets/doces_recipe.dart';
import 'package:receitas/widgets/fit_recipe.dart';
import 'package:receitas/widgets/frutos_do_mar_recipe.dart';
import 'package:receitas/widgets/massas_recipe.dart';
import 'package:receitas/widgets/peixes_recipe.dart';
import 'package:receitas/widgets/popular_recipe.dart';
import 'package:receitas/widgets/saladas_recipe.dart';
import 'package:receitas/widgets/salgadas_recipe.dart';
import 'package:receitas/widgets/sopas_recipe.dart';

class RecipeCategories extends StatelessWidget {
  const RecipeCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // const Text("Receitas Populares",
          // style: TextStyle(
          //   fontSize: 20,
          //   fontWeight: FontWeight.bold
          // ),),
          // recipe(),
          // Divider(
          //   color: Colors.black.withOpacity(0.3),
          // ),
          const Text("Aves",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          recipeAves(),
          Divider(
             color: Colors.black.withOpacity(0.3),
           ),
          const Text("Carnes",
             style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold
             ),
          ),
          recipeCarnes(),
          Divider(
            color: Colors.black.withOpacity(0.3),
          ),
          const Text("Peixes",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          recipePeixes(),
          Divider(
            color: Colors.black.withOpacity(0.3),
          ),
          const Text("Massas",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          recipeMassas(),
          Divider(
            color: Colors.black.withOpacity(0.3),
          ),
          const Text("Frutos do Mar",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          recipeFrutosDoMar(),
          Divider(
            color: Colors.black.withOpacity(0.3),
          ),
          const Text("Sopas",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          recipeSopas(),
          Divider(
            color: Colors.black.withOpacity(0.3),
          ),
          const Text("Saladas",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          recipeSaladas(),
          Divider(
            color: Colors.black.withOpacity(0.3),
          ),
          const Text("Receitas Salgadas",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          recipeSalgadas(),
          Divider(
            color: Colors.black.withOpacity(0.3),
          ),
          const Text("Doces",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          recipeDoces(),
          Divider(
            color: Colors.black.withOpacity(0.3),
          ),
          const Text("Bolos e Tortas",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          recipeBolosTortas(),
          Divider(
            color: Colors.black.withOpacity(0.3),
          ),
          const Text("Bebidas",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          recipeBebidas(),
          Divider(
            color: Colors.black.withOpacity(0.3),
          ),
          const Text("Receitas Saúdavel",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          recipeFit(),
          // Divider(
          //   color: Colors.black.withOpacity(0.3),
          // ),
          // const Text("Receitas Fitnes",
          //   style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold
          //   ),),
          // recipe(),
        ],
      )
    );
  }
}




