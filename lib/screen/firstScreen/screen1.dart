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
            ],
          )));
    });
  }
}
