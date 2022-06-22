// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:explore_universe/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0x0f1f0c57),
      body: SafeArea(
          child: Column(
        children: [
          LottieBuilder.asset("assets/images/space-ride.json"),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "The Universe is an endless space.",
                  style: bigBoldTextStyle,
                ),
                Text(
                  "But, before we begin our journey",
                  style: bigBoldTextStyle,
                ),
                Text(
                  "Please enter our rocket name : ",
                  style: bigBoldTextStyle,
                ),
                TextFormField()
              ],
            ),
          ),
        ],
      )),
    );
  }
}
