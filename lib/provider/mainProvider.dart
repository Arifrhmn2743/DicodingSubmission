import 'package:dio/dio.dart';
import 'package:explore_universe/model/solar_system_detail_model.dart';
import 'package:explore_universe/model/solar_system_model.dart';
import 'package:flutter/material.dart';
import 'package:explore_universe/utils/const.dart';

import '../model/apod_model.dart';

class MainProvider with ChangeNotifier {
  Apod? data;
  SolarSystemDetails? solarSystemDetails;
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
    isLoading = true;
    try {
      var response = await Dio().get('$linkApiApod?api_key=$apiKey');
      print(response.data);
      data = Apod.fromJson(response.data);
      notifyListeners();
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getDetailSolarSystem(String objectID) async {
    isLoading = true;
    try {
      var response = await Dio().get('$linkApiPlanetDetail/$objectID');
      print(response.data);
      solarSystemDetails = SolarSystemDetails.fromJson(response.data);
      notifyListeners();
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }

  final List<SolarSystem> _solarSystemItems = [
    SolarSystem(
        objectImage: "assets/images/sun.png",
        objectName: "Sun",
        objectId: "soleil"),
    SolarSystem(
        objectImage: "assets/images/mercury.png",
        objectName: "Mercury",
        objectId: "mercure"),
    SolarSystem(
        objectImage: "assets/images/venus.png",
        objectName: "Venus",
        objectId: "venus"),
    SolarSystem(
        objectImage: "assets/images/earth.png",
        objectName: "Earth",
        objectId: "terre"),
    SolarSystem(
        objectImage: "assets/images/mars.png",
        objectName: "Mars",
        objectId: "mars"),
    SolarSystem(
        objectImage: "assets/images/jupiter.png",
        objectName: "Jupiter",
        objectId: "jupiter"),
    SolarSystem(
        objectImage: "assets/images/saturn.png",
        objectName: "Saturn",
        objectId: "saturne"),
    SolarSystem(
        objectImage: "assets/images/uranus.png",
        objectName: "Uranus",
        objectId: "uranus"),
    SolarSystem(
        objectImage: "assets/images/neptune.png",
        objectName: "Neptunus",
        objectId: "neptune"),
    SolarSystem(
        objectImage: "assets/images/pluto.png",
        objectName: "Pluto",
        objectId: "pluton"),
  ];

  List<SolarSystem> get solarSystemItems {
    return [..._solarSystemItems];
  }
}
