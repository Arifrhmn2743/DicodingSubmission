import 'package:explore_universe/provider/mainProvider.dart';
import 'package:explore_universe/screen/solarSystem/solarSystemDetail.dart';
import 'package:explore_universe/utils/colors.dart';
import 'package:explore_universe/utils/const.dart';
import 'package:explore_universe/widget/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SolarSystemPage extends StatelessWidget {
  const SolarSystemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallet.primary,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Our Solar System",
          style: bigBoldWhiteTextStyle,
        ),
      ),
      body: Consumer<MainProvider>(builder: (context, value, child) {
        return SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                GridView.builder(
                    gridDelegate: ResponsiveWidget.isSmallScreen(context)
                        ? SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            crossAxisCount: 2,
                          )
                        : SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 5 / 5,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            crossAxisCount: 5,
                          ),
                    itemCount: value.solarSystemItems.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => Get.to(SolarSystemDetail(
                            id: value.solarSystemItems[index].objectId,
                            image: value.solarSystemItems[index].objectImage,
                            name: value.solarSystemItems[index].objectName,
                          )),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: ColorPallet.light,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      value.solarSystemItems[index].objectName,
                                      style: bigBoldWhiteTextStyle,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Image.asset(
                                  value.solarSystemItems[index].objectImage,
                                  width: 90,
                                  height: 90,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ));
      }),
    );
  }
}
