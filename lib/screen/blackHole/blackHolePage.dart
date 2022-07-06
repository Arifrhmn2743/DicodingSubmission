import 'package:explore_universe/screen/blackHole/blackHoleDetail.dart';
import 'package:explore_universe/utils/colors.dart';
import 'package:explore_universe/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../provider/mainProvider.dart';

class BlackHolePage extends StatefulWidget {
  const BlackHolePage({Key? key}) : super(key: key);

  @override
  State<BlackHolePage> createState() => _BlackHolePageState();
}

class _BlackHolePageState extends State<BlackHolePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallet.darkPurple,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Black Hole",
          style: bigBoldWhiteTextStyle,
        ),
      ),
      body: Consumer<MainProvider>(builder: (context, value, child) {
        return SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      crossAxisCount: 2,
                    ),
                    itemCount: value.blackHole.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => Get.to(BlackHoleDetail(
                          id: value.blackHole[index].objectId,
                          image: value.blackHole[index].objectImage,
                          name: value.blackHole[index].objectName,
                          desc: value.blackHole[index].objectDesc,
                          link: value.blackHole[index].objectSource,
                        )),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: ColorPallet.lightPurple,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    value.blackHole[index].objectName,
                                    style: bigBoldWhiteTextStyle,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(81),
                                child: Image.asset(
                                  value.blackHole[index].objectImage,
                                  width: 90,
                                  height: 90,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Disclaimer: Only Black holes that have picture are shown here",
                  style: italicWhiteTextStyle,
                )
              ],
            ),
          ),
        ));
      }),
    );
  }
}
