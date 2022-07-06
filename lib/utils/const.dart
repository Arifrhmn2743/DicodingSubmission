import 'package:flutter/material.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

const TextStyle regularTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

const TextStyle titleTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);
const TextStyle bigBoldTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.w800,
);

const TextStyle regularWhiteTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

const TextStyle italicWhiteTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 12,
  fontStyle: FontStyle.italic,
);
const TextStyle underlineWhiteTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 12,
  fontStyle: FontStyle.italic,
  decoration: TextDecoration.underline,
);

const TextStyle titleWhiteTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

const TextStyle bigBoldWhiteTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.w800,
);
var raisedDecoration = BoxDecoration(
  color: Color.fromARGB(255, 231, 231, 231),
  borderRadius: BorderRadius.circular(16),
  border: Border.all(
    color: Color.fromARGB(15, 220, 219, 219),
  ),
);

//please use your legal api from https://api.nasa.gov/
const String apiKey = "bXxhKpHeLZRUbf1Iteh7wkTNiMgQGQSpAsvbCnI8";

const String linkApiApod = "https://api.nasa.gov/planetary/apod/";

const String linkApiPlanetDetail =
    "https://api.le-systeme-solaire.net/rest/bodies";
