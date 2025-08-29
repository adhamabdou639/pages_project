// ignore_for_file: sort_child_properties_last, deprecated_member_use

import 'package:firebase_app/screens/signin.dart';
import 'package:firebase_app/shared/colors.dart';
import 'package:firebase_app/shared/constants.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool  isVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login", style: TextStyle(fontSize: 25)),
        backgroundColor: appbarGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  decoration: textDecoration.copyWith(
                    hintText: "Enter your email",
                    suffixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 25),
                TextField(
                  keyboardType: TextInputType.text,
                  obscureText: isVisibility? true : false,
                  decoration: textDecoration.copyWith(
                    hintText: "Enter your password",
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          isVisibility = !isVisibility;
                        });
                      },
                      icon: isVisibility? Icon(Icons.visibility,color: Colors.green,) : Icon(Icons.visibility_off) ,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(BTNgreen),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(15),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    TextButton(onPressed: () {
                      Navigator.pushReplacement(context ,
                      MaterialPageRoute(builder: (context) => const Signin()) );}, child: Text("Sign Up")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
