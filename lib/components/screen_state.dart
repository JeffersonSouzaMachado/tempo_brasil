import 'package:flutter/material.dart';

class ScreenState extends ChangeNotifier {
  bool _updateScreen = false;



  bool get updateScreen => _updateScreen;


  set updateScreen(bool value) {
    _updateScreen = value;
    notifyListeners();
  }
}