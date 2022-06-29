import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:explore_universe/utils/const.dart';

import '../model/apod_model.dart';

class MainProvider with ChangeNotifier {
  Apod? data;
  bool isLoading = true;
  late String _rocketName;
  String get rocketName {
    return _rocketName;
  }

  void setRocketName(String name) {
    _rocketName = name;
    notifyListeners();
  }

  Future<void> getApod() async {
    try {
      var response = await Dio().get('$linkApi?api_key=$apiKey');
      print(response.data);
      data = Apod.fromJson(response.data);
      notifyListeners();
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
