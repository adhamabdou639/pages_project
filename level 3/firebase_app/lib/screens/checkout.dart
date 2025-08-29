// ignore_for_file: unused_local_variable, sort_child_properties_last, dead_code, deprecated_member_use

import 'package:firebase_app/provider/selectproduct.dart';
import 'package:firebase_app/shared/appbar.dart';
import 'package:firebase_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    final chartt = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Check out"),
        backgroundColor: appbarGreen,
        actions: [AppbarShared()],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 590,
            child: ListView.builder(
              itemCount: chartt.selectProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        chartt.selectProducts[index].imgPath,
                      ),
                    ),
                    title: Text(chartt.selectProducts[index].name),
                    subtitle: Text(
                      "${chartt.selectProducts[index].price} , ${chartt.selectProducts[index].location}",
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        chartt.removeProduct(chartt.selectProducts[index]);
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Pay \$${chartt.totalPrice}",
              style: TextStyle(fontSize: 18),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber),
              padding: MaterialStateProperty.all(EdgeInsets.all(8)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
