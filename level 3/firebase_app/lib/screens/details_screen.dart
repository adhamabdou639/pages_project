// ignore_for_file: sort_child_properties_last, must_be_immutable, non_constant_identifier_names

import 'package:firebase_app/models/products.dart';
import 'package:firebase_app/shared/colors.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  Products Product;
  DetailsScreen({super.key, required this.Product});
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isShowMore = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        backgroundColor: appbarGreen,
        title: Text("Details Product", style: TextStyle()),
        actions: [
          Stack(
            children: [
              Positioned(
                bottom: 15,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(211, 164, 255, 193),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "8",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_shopping_cart, color: Colors.black),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 11.0),
            child: Text("\$ 104"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.Product.imgPath),
            SizedBox(height: 5),
            Text("\$ ${widget.Product.price}"),
            SizedBox(height: 5),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(4),
                  child: Text("NEW", style: TextStyle(fontSize: 12)),
                  decoration: BoxDecoration(color: Colors.redAccent),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[800]),
                    Icon(Icons.star, color: Colors.yellow[800]),
                    Icon(Icons.star, color: Colors.yellow[800]),
                    Icon(Icons.star, color: Colors.yellow[800]),
                    Icon(Icons.star, color: Colors.yellow[800]),
                  ],
                ),
                SizedBox(width: 115),
                Row(
                  children: [
                    Icon(
                      Icons.edit_location,
                      color: Color.fromARGB(163, 5, 63, 27),
                    ),
                    Text(widget.Product.location),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(5),
              alignment: Alignment.centerLeft,
              child: Text("Detalis : ", style: TextStyle(fontSize: 18)),
            ),

            Text(
              "Flowers, also known as blossoms and blooms, are the reproductive structures of flowering plants. Typically, they are structured in four circular levels around the end of a stalk. These include: sepals, which are modified leaves that support the flower; petals, often designed to attract pollinators; male stamens, where pollen is presented; and female gynoecia, where pollen is received and its movement is facilitated to the egg. When flowers are arranged in a group, they are known collectively as an inflorescence.",
              maxLines: isShowMore ? 3 : null,
              overflow: TextOverflow.fade,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isShowMore = !isShowMore;
                });
              },
              child: Text(
                isShowMore ? "Show more... " : "Show less",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
