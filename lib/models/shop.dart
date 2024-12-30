import 'package:flutter/material.dart';
import 'package:onlineshop/models/product.dart';

class Shop extends ChangeNotifier {
  // products
  final List<Product> _shop = [
    Product(
      name: "product 1",
      price: 99.9,
      description: "Item description..",
      imagePath: "",
      category: "Shoes",
    ),
    Product(
      name: "product 2",
      price: 79.9,
      description: "Item description..",
      imagePath: "",
      category: "Clothes",
    ),
    Product(
      name: "product 3",
      price: 99.9,
      description: "Item description..",
      imagePath: "Electronics",
      category: "Clothes",
    ),
    Product(
      name: "product 4",
      price: 29.9,
      description: "Item description..",
      imagePath: "",
      category: "Electronics",
    ),
  ];
  // user cart
  final List<Product> _cart = [];

  // get products
  List<Product> get shop => _shop;

  // get cart
  List<Product> get cart => _cart;

  // add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
