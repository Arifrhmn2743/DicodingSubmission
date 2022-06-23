import 'package:explore_universe/provider/mainProvider.dart';
import 'package:explore_universe/screen/screen3.dart';
import 'package:explore_universe/utils/const.dart' as test;
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
          Consumer<MainProvider>(builder: (context, value, child) {
            return SafeArea(
                child: Column(
              children: [
                LottieBuilder.asset("assets/images/space-ride.json"),
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
                      value.rocketName == ""
                          ? SizedBox()
                          : Text(
                              "With our rocket ${value.rocketName.capitalizeFirst} ready, lets explore the universe!",
                              style: test.bigBoldTextStyle,
                            ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.to(Screen3());
                        },
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 64, 20, 140),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12.withOpacity(0.08),
                                    blurRadius: 10.0,
                                    spreadRadius: 3.0,
                                  )
                                ]),
                            width: size.width / 2,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Begin our journey",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ));
          })
        ],
      ),
    );
  }
}
