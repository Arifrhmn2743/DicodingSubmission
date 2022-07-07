import 'dart:ui';

import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:explore_universe/provider/mainProvider.dart';
import 'package:explore_universe/utils/colors.dart';
import 'package:explore_universe/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class SolarSystemDetail extends StatefulWidget {
  // const SolarSystemDetail({Key? key}) : super(key: key);
  String id, name, image;
  SolarSystemDetail(
      {required this.id, required this.image, required this.name});

  @override
  State<SolarSystemDetail> createState() => _SolarSystemDetailState();
}

class _SolarSystemDetailState extends State<SolarSystemDetail> {
  void getData(String id) async {
    final getData = Provider.of<MainProvider>(context, listen: false);
    await getData.getDetailSolarSystem(id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Details About ${widget.name}",
          style: bigBoldWhiteTextStyle,
        ),
      ),
      backgroundColor: ColorPallet.primary,
      body: Consumer<MainProvider>(builder: (context, value, child) {
        return SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: value.isLoading == true
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Image.asset(
                        widget.image,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: ColorPallet.light,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "General Data :",
                                  style: titleWhiteTextStyle,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Other Name: ",
                                        style: regularWhiteTextStyle,
                                      ),
                                      Text(
                                        "Body Type: ",
                                        style: regularWhiteTextStyle,
                                      ),
                                      Text(
                                        "Discovered By:",
                                        style: regularWhiteTextStyle,
                                      ),
                                      Text(
                                        "Moons: ",
                                        style: regularWhiteTextStyle,
                                      ),
                                      Text(
                                        "Mass: ",
                                        style: regularWhiteTextStyle,
                                      ),
                                      Text(
                                        "Volume: ",
                                        style: regularWhiteTextStyle,
                                      ),
                                      Text(
                                        "Gravity:",
                                        style: regularWhiteTextStyle,
                                      ),
                                      Text(
                                        "Average Temp: ",
                                        style: regularWhiteTextStyle,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value.solarSystemDetails?.name
                                                .toString() ??
                                            "",
                                        style: regularWhiteTextStyle,
                                      ),
                                      Text(
                                        value.solarSystemDetails?.bodyType
                                                .toString() ??
                                            "",
                                        style: regularWhiteTextStyle,
                                      ),
                                      Text(
                                        value.solarSystemDetails?.discoveredBy
                                                .toString() ??
                                            "",
                                        style: regularWhiteTextStyle,
                                      ),
                                      Text(
                                        value.solarSystemDetails?.moons?.length
                                                .toString() ??
                                            "",
                                        style: regularWhiteTextStyle,
                                      ),
                                      EasyRichText(
                                        "${value.solarSystemDetails?.mass?.massValue.toString()} x 10 ${value.solarSystemDetails?.mass?.massExponent.toString()} Kg",
                                        patternList: [
                                          EasyRichTextPattern(
                                            targetString:
                                                "${value.solarSystemDetails?.mass?.massExponent.toString()}",
                                            superScript: true,
                                            stringBeforeTarget: "x 10 ",
                                            matchWordBoundaries: false,
                                            style: regularWhiteTextStyle,
                                          )
                                        ],
                                        defaultStyle: regularWhiteTextStyle,
                                      ),
                                      EasyRichText(
                                        "${value.solarSystemDetails?.vol?.volValue.toString()} x 10 ${value.solarSystemDetails?.vol?.volExponent.toString()} Km 3",
                                        patternList: [
                                          EasyRichTextPattern(
                                            targetString:
                                                "${value.solarSystemDetails?.vol?.volExponent.toString()}",
                                            superScript: true,
                                            stringBeforeTarget: "x 10 ",
                                            style: regularWhiteTextStyle,
                                          ),
                                          EasyRichTextPattern(
                                            targetString: "3",
                                            superScript: true,
                                            stringBeforeTarget: "Km",
                                            style: regularWhiteTextStyle,
                                          )
                                        ],
                                        defaultStyle: regularWhiteTextStyle,
                                      ),
                                      EasyRichText(
                                        "${value.solarSystemDetails?.gravity.toString()} m.s-2",
                                        patternList: [
                                          EasyRichTextPattern(
                                            targetString: "-2",
                                            superScript: true,
                                            stringBeforeTarget: "m.s",
                                            matchWordBoundaries: false,
                                            style: regularWhiteTextStyle,
                                          )
                                        ],
                                        defaultStyle: regularWhiteTextStyle,
                                      ),
                                      Text(
                                        "${value.solarSystemDetails?.avgTemp.toString()} K",
                                        style: regularWhiteTextStyle,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        ));
      }),
    );
  }
}
