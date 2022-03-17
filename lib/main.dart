import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:receitas/constants/color_const.dart';
import 'package:receitas/pages/home_page.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Demo',
      theme: ThemeData(
        primarySwatch: kOrange
      ),
      home: HomePage(),
    );
  }
}
