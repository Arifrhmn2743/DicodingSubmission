// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:explore_universe/provider/mainProvider.dart';
import 'package:explore_universe/screen/screen2.dart';
import 'package:explore_universe/utils/colors.dart';
import 'package:explore_universe/utils/const.dart';
import 'package:explore_universe/widget/responsive.dart';
import 'package:explore_universe/widget/topWidget.dart';
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
            backgroundColor: ColorPallet.dark,
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
          backgroundColor: ColorPallet.primary,
          body: SafeArea(
              child: Column(
            children: [
              TopContainer(
                  height: ResponsiveWidget.isSmallScreen(context) ? 200 : 400,
                  width: MediaQuery.of(context).size.width,
                  child: LottieBuilder.network(
                    'https://assets4.lottiefiles.com/packages/lf20_yznfvm5w.json',
                    fit: BoxFit.fill,
                  )),
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "The universe is a wonderful place",
                        style: bigBoldWhiteTextStyle,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Before we begin our journey, Please name our rocket ship !",
                        style: bigBoldWhiteTextStyle,
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 56,
                        padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
                        decoration: raisedDecoration,
                        child: Center(
                          child: TextField(
                            autofocus: true,
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
                ),
              ))
            ],
          )));
    });
  }
}
