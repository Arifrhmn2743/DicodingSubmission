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
var raisedDecoration = BoxDecoration(
  color: Color.fromARGB(255, 231, 231, 231),
  borderRadius: BorderRadius.circular(16),
  border: Border.all(
    color: Color.fromARGB(15, 220, 219, 219),
  ),
);
