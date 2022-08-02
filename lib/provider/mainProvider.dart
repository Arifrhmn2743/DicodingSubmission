import 'package:dio/dio.dart';
import 'package:explore_universe/model/black_hole_model.dart';
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
    // isLoading = false;
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
    // isLoading = false;
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

  final List<BlackHole> _blackHole = [
    BlackHole(
        objectImage: "assets/images/M87.png",
        objectName: "Black hole M87",
        objectId: "M87",
        objectDesc:
            "M87, in full Messier 87, also called Virgo A or NGC4486, giant elliptical galaxy in the constellation Virgo whose nucleus contains a black hole, the first ever to be directly imaged. M87 is the most powerful known source of radio energy among the thousands of galactic systems constituting the so-called Virgo Cluster. It is also a powerful X-ray source, which suggests the presence of very hot gas in the galaxy. A luminous gaseous jet projects outward from the galactic nucleus. Both the jet and the nucleus emit synchrotron radiation, a form of nonthermal radiation released by charged particles that are accelerated in magnetic fields and travel at speeds near that of light. M87 lies about 55 million light-years from Earth.",
        objectSource: "https://www.britannica.com/place/Virgo-A"),
    BlackHole(
        objectImage: "assets/images/sagittarius.jpg",
        objectName: "Sagittarius A*",
        objectId: "SA",
        objectDesc:
            "Sagittarius A* (Sgr A*), supermassive black hole at the centre of the Miky Way Galaxy, located in the constellation Sagittarius and having a mass equivalent to four million Suns. It is a strong source of radio waves and is embedded in the larger Sagittarius A complex. Most of the radio radiation is from a synchrotron mechanism, indicating the presence of free electrons and magnetic fields. Sagittarius A* (pronounced “Sagittarius a star”) is a compact, extremely bright point source. X-ray, infrared, spectroscopic, and radio interferometric investigations have indicated the very small dimensions of this region; the event horizon of the black hole has a radius of 12 million km (7 million miles). Infrared observations of stars orbiting the position of Sagittarius A* demonstrate the presence of a black hole. ",
        objectSource:
            "https://www.britannica.com/place/Sagittarius-A-astronomy")
  ];
  List<BlackHole> get blackHole {
    return [..._blackHole];
  }
}
