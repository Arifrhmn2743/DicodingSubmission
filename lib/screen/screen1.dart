// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:explore_universe/provider/mainProvider.dart';
import 'package:explore_universe/screen/screen2.dart';
import 'package:explore_universe/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, value, child) {
      return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color.fromARGB(255, 64, 20, 140),
          onPressed: () {
            if (value.rocketName == "") {
              Get.defaultDialog(
                title: "Warning!",
                middleText: "Rocket name cannot be empty ",
              );
            } else {
              Get.to(Screen2());
            }
          },
          label: Row(
            children: [
              Text(
                "Next Step",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
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
                              value.setRocketName(v);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ))
          ],
        ),
      );
    });
  }
}
