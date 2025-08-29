import 'package:firebase_app/provider/selectproduct.dart';
import 'package:firebase_app/screens/checkout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppbarShared extends StatelessWidget {
  const AppbarShared({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: ((context, cart, child) {
        return Row(
          children: [
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
                      "${cart.selectProducts.length}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CheckOut(),
                ),
              );
                  },
                  icon: Icon(Icons.add_shopping_cart, color: Colors.black),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 11.0),
              child: Text("\$ ${cart.totalPrice}"),
            ),
          ],
        );
      }),
    );
  }
}
