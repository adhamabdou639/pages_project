// ignore_for_file: use_build_context_synchronously

import 'package:final_project_level2/classes/getData.dart';
import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

List<AllCountries> allCountries = [
  AllCountries(
    link: 'Africa/Cairo',
    nameCountry: 'Egypt - Cairo',
    flag: 'egypt.png',
  ),
  AllCountries(
    link: 'Africa/Tunis',
    nameCountry: 'Tunisia - Tunis',
    flag: 'tunisia.png',
  ),
  AllCountries(
    link: 'Africa/Algiers',
    nameCountry: 'Algeria - Algiers',
    flag: 'algeria.png',
  ),
  AllCountries(
    link: 'Australia/Sydney',
    nameCountry: 'Australia - Sydney',
    flag: 'australia.png',
  ),
  AllCountries(
    link: 'America/Toronto',
    nameCountry: 'Canada - Toronto',
    flag: 'canada.png',
  ),
  AllCountries(
    link: 'Asia/Riyadh',
    nameCountry: '	Saudi Arabia - Riyadh',
    flag: 'sa.png',
  ),
];

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text(
          "Choose Location",
          style: TextStyle(color: const Color.fromARGB(255, 255, 0, 0)),
        ),
        backgroundColor: const Color.fromARGB(255, 141, 223, 152),
      ),
      body: SizedBox(
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: allCountries.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                onTap: () async {
                  AllCountries clickedCountry = allCountries[index];
                  await clickedCountry.getData();
            
                  Navigator.pop(context,
                   {
                      "time": clickedCountry.timeNow,
                      "locate": clickedCountry.timeZone,
                      "isNightOR_Morning": clickedCountry.isDayTime,
                    },
                  );
                },
                title: Text(
                  allCountries[index].nameCountry,
                  style: TextStyle(fontSize: 22),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/${allCountries[index].flag}",
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
