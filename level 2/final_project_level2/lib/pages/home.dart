// ignore_for_file: deprecated_member_use, unused_local_variable

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

Map collectData = {};

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //                                  store data from loading page
    collectData = collectData.isEmpty
        ? ModalRoute.of(context)!.settings.arguments as Map
        : collectData;
    // {  timeNow               timezone                    }
    String images = collectData["isNightOR_Morning"]
        ? "morning.png"
        : "night.png";
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 55, 56, 63),
            image: DecorationImage(
              image: AssetImage("assets/$images"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    dynamic reciveData = await Navigator.pushNamed(
                      context,
                      "/location",
                    );
                    setState(() {
                      if (reciveData == null) {
                        collectData = {
                        "time": "time not define",
                        "locate": "please chooes a location",
                        "isNightOR_Morning": true
                      };
                      } else {
                        collectData = {
                        "time": reciveData["time"],
                        "locate": reciveData["locate"],
                        "isNightOR_Morning": reciveData["isNightOR_Morning"]
                      };
                      }
                    });
                  },
                  label: Text(
                    "Edit location",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.edit_location,
                    color: const Color.fromARGB(255, 255, 129, 129),
                    size: 22,
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(146, 90, 103, 223),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  color: const Color.fromARGB(103, 0, 0, 0),
                  child: Column(
                    children: [
                      Text(
                        collectData["time"],
                        style: TextStyle(fontSize: 60, color: Colors.white),
                      ),
                      SizedBox(height: 60),
                      Text(
                        collectData["locate"],
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
