import 'package:flutter/material.dart';

class Category extends ChangeNotifier {
  String _selectedCategory = "All";

  String get selectedCategory => _selectedCategory;

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
