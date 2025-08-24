// ignore_for_file: deprecated_member_use, avoid_print, use_build_context_synchronously

import 'package:final_project_level2/classes/getData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getDataLoadingPage() async {
    AllCountries oneCountry = AllCountries(link:"Africa",nameCountry:"Egypt - cariro",flag:"egypt.png");
    await oneCountry.getData();
    
    Navigator.pushReplacementNamed(
      context,
      "/home",
      arguments: {
        "time": oneCountry.timeNow,
        "locate": oneCountry.timeZone,
        "isNightOR_Morning": oneCountry.isDayTime,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getDataLoadingPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading Page", style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 245, 198, 213),
      ),

      body: Center(
        //Example using CircularProgressIndicator (built-in Flutter widget)
        child: SpinKitFadingCircle(
          color: const Color.fromARGB(146, 12, 16, 49),
          size: 130.0,
        ),
      ),
    );
  }
}
