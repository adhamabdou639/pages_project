//import 'package:firebase_app/screens/details_screen.dart';
import 'package:firebase_app/provider/selectproduct.dart';
import 'package:firebase_app/screens/checkout.dart';
import 'package:firebase_app/screens/home.dart';
import 'package:firebase_app/screens/login.dart';
import 'package:firebase_app/screens/sign_or_login.dart';
import 'package:firebase_app/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => const SignOrLogin(),
          "/login": (context) => const Login(),
          "/Sign_in": (context) => const Signin(),
          "/Home": (context) => const Home(),
          "/checkout": (context) => const CheckOut(),
          // "/DetailsScreen": (context) => const DetailsScreen(),
        },
        
      ),
    );
  }
}

