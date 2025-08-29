// ignore_for_file: sort_child_properties_last, non_constant_identifier_names

import 'package:firebase_app/models/products.dart';
import 'package:firebase_app/provider/selectproduct.dart';
import 'package:firebase_app/screens/checkout.dart';
import 'package:firebase_app/screens/details_screen.dart';
import 'package:firebase_app/screens/signin.dart';
import 'package:firebase_app/shared/appbar.dart';
import 'package:firebase_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/night.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/img/Adham.copy.jpg"),
                  ),
                  accountName: Text("Adham Abdo"),
                  accountEmail: Text("adhamabdo@gmail.com"),
                ),
                ListTile(
                  title: Text("Home"),
                  leading: Icon(Icons.home),
                  onTap: () {Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Home(),
                ),
              );},
                ),
                ListTile(
                  title: Text("My Products"),
                  leading: Icon(Icons.add_shopping_cart),
                  onTap: () {Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CheckOut(),
                ),
              );},
                ),
                ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.help_center),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Log out"),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signin()),
                    );
                  },
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Text("Developed by Adham Abdo"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text("Home", style: TextStyle()),
        actions: [
        AppbarShared(),
        ],
      ),

      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: screenDetelis.length,
        itemBuilder: (BuildContext context, int indxe) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsScreen(Product: screenDetelis[indxe]),
                ),
              );
            },
            child: GridTile(
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 22,
                    left: 3,
                    bottom: -9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(screenDetelis[indxe].imgPath),
                    ),
                  ),
                ],
              ),
              footer: GridTileBar(
                trailing: Consumer<Cart>(
                  builder: ((context, Carttt, child) {
                    return IconButton(
                      onPressed: () {
                        Carttt.add(screenDetelis[indxe]);
                      },
                      icon: Icon(Icons.add, color: Colors.black),
                    );
                  }),
                ),
                leading: Text("\$${screenDetelis[indxe].price}"),
                title: Text(" "),
              ),
            ),
          );
        },
      ),
    );
  }
}
