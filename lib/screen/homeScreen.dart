// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:explore_universe/provider/mainProvider.dart';
import 'package:explore_universe/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String namaRoket = "";
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0x0f1f0c57),
      body: Consumer<MainProvider>(builder: (context, value, child) {
        return SafeArea(
            child: Column(
          children: [
            LottieBuilder.asset("assets/images/universe.json"),
            Expanded(
                child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.grey[50],
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "The universe is a wonderful place",
                      style: bigBoldTextStyle,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Before we begin our journey, Please name our rocket ship !",
                      style: bigBoldTextStyle,
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 56,
                      padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
                      margin: EdgeInsets.all(8),
                      decoration: raisedDecoration,
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Rocket name",
                          ),
                          onChanged: (v) {
                            setState(() {
                              namaRoket = v.toString();
                              print(namaRoket);
                              value.setRocketName(namaRoket);
                            });
                          },
                        ),
                      ),
                    ),
                    //233551
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          print(value.rocketName);
                          print("object");
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color(0x00233551),
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ));
      }),
    );
  }
}
