import 'package:explore_universe/provider/mainProvider.dart';
import 'package:explore_universe/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/bg.png"))),
          ),
          Consumer<MainProvider>(builder: (context, value, child) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
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
                          Icon(
                            Icons.help_outline_outlined,
                            color: Colors.white,
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
                              image: AssetImage("assets/images/galaxy_bg.jpg"),
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
                              image: AssetImage("assets/images/black_hole.png"),
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
                                  AssetImage("assets/images/solar_system.png"),
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
                              image: AssetImage("assets/images/bg_cards4.jpg"),
                              fit: BoxFit.fill),
                        ),
                        height: 150,
                      )
                    ],
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
