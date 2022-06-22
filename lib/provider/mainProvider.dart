import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier {
  late String _rocketName;
  String get rocketName {
    return _rocketName;
  }

  void setRocketName(String name) {
    _rocketName = name;
    notifyListeners();
  }
}
