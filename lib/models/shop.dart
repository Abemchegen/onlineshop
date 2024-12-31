import 'package:flutter/material.dart';
import 'package:onlineshop/models/product.dart';
import 'package:onlineshop/services/api_service.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [];
  final List<Product> _cart = [];
  final ApiService api = ApiService();

  // get products
  List<Product> get shop => _shop;

  // get cart
  List<Product> get cart => _cart;

  // fetch products
  Future<void> loadProducts() async {
    try {
      final productsData = await api.fetchProducts();
      _shop.clear();
      _shop.addAll(productsData.map((data) => Product(
          name: data['name'],
          price: data["price"],
          description: data['discription'],
          imagePath: data['image_path'],
          category: data['category'])));
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

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

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
