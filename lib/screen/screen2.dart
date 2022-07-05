import 'package:explore_universe/provider/mainProvider.dart';
import 'package:explore_universe/screen/apod.dart';
import 'package:explore_universe/screen/references.dart';
import 'package:explore_universe/utils/colors.dart';
import 'package:explore_universe/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPallet.darkPurple,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Consumer<MainProvider>(builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Let's explore together, ${value.rocketName.toUpperCase()} !",
                                style: bigBoldWhiteTextStyle,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Get.to(References()),
                              child: Icon(
                                Icons.help_outline_outlined,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/galaxy_bg.jpg"),
                                fit: BoxFit.fill,
                                opacity: .8),
                          ),
                          height: 150,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/black_hole.png"),
                                fit: BoxFit.fill,
                                opacity: .8),
                          ),
                          height: 150,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/solar_system.png"),
                                fit: BoxFit.fill,
                                opacity: .8),
                          ),
                          height: 150,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(Apod()),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/bg_cards4.jpg"),
                                  fit: BoxFit.fill,
                                  opacity: .8),
                            ),
                            height: 150,
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                "APOD (Astronomy Picture of the Day)",
                                style: bigBoldWhiteTextStyle,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                })
              ],
            ),
          ),
        ));
  }
}
