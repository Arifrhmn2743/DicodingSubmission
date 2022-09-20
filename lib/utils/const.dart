import 'package:flutter/material.dart';

const TextStyle regularWhiteTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 14,
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
  fontSize: 18,
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
