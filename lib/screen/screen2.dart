import 'package:explore_universe/provider/mainProvider.dart';
import 'package:explore_universe/screen/apod.dart';
import 'package:explore_universe/screen/blackHole/blackHolePage.dart';
import 'package:explore_universe/screen/references.dart';
import 'package:explore_universe/screen/solarSystem/solarSystemPage.dart';
import 'package:explore_universe/utils/colors.dart';
import 'package:explore_universe/utils/const.dart';
import 'package:explore_universe/widget/responsive.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPallet.primary,
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
                                user!.displayName != null
                                    ? "Hello,  ${user!.displayName}!"
                                    : "Hello, ",
                                style: bigBoldWhiteTextStyle,
                              ),
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => Get.to(References()),
                                child: Icon(
                                  Icons.help_outline_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => Get.to(BlackHolePage()),
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/black_hole.png"),
                                      fit: BoxFit.fill,
                                      opacity: .5),
                                ),
                                height: ResponsiveWidget.isSmallScreen(context)
                                    ? 150
                                    : 500,
                                child: Center(
                                  child: Text(
                                    "Black Hole",
                                    style: bigBoldWhiteTextStyle,
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => Get.to(SolarSystemPage()),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/solar_system.png"),
                                    fit: BoxFit.fill,
                                    opacity: .5),
                              ),
                              height: ResponsiveWidget.isSmallScreen(context)
                                  ? 150
                                  : 500,
                              child: Center(
                                child: Text(
                                  "Solar System ",
                                  style: bigBoldWhiteTextStyle,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => Get.to(Apod()),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/bg_cards4.jpg"),
                                    fit: BoxFit.fill,
                                    opacity: .8),
                              ),
                              height: ResponsiveWidget.isSmallScreen(context)
                                  ? 150
                                  : 500,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  "APOD (Astronomy Picture of the Day)",
                                  style: bigBoldWhiteTextStyle,
                                ),
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
