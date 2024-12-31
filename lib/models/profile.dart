import 'package:flutter/material.dart';

class Profile extends ChangeNotifier {
  // Profile data
  String name = "John Doe";
  String email = "johndoe@example.com";

  void updateName(String newName) {
    name = newName;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    email = newEmail;
    notifyListeners();
  }
}
