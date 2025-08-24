
import 'package:final_project_level2/pages/home.dart';
import 'package:final_project_level2/pages/loading.dart';
import 'package:final_project_level2/pages/location.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    
      initialRoute: "/",
      routes: {
        "/" : (context) => const Loading(),
        "/home" : (context) => const Home(),
        "/location" : (context) => const Location(),
      },

    );
  }
}

