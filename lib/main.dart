import 'package:flutter/material.dart';
import 'home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black26,
          iconTheme: const IconThemeData(color: Colors.white),
          textTheme: const TextTheme(
            headline1:TextStyle(
                fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black
            ),
            headline2:TextStyle(
                fontSize: 34,fontWeight: FontWeight.bold,color: Colors.white
            ),
            headline3:TextStyle(
                fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white
            ),
            bodyText1:TextStyle(
                fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black
            ),

          )
      ),
      home: const Home(),
    );
  }
}

