// ignore_for_file: non_constant_identifier_names

import 'package:firebase_app/models/products.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List selectProducts = [];
  int totalPrice = 0;

  add(Products Itemproduct) {
    selectProducts.add(Itemproduct);
    totalPrice += Itemproduct.price.round();
    notifyListeners();
  }

  removeProduct(Products s) {
    selectProducts.remove(s);
    totalPrice -= s.price.round();
    notifyListeners();
  }
}
