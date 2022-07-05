import 'dart:ui';

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
      backgroundColor: ColorPallet.darkPurple,
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "General Data :",
                                  style: titleTextStyle,
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
                                      Text("Other Name: "),
                                      Text("Body Type: "),
                                      Text("Discovered By:"),
                                      Text("Moons: "),
                                      Text("Mass: "),
                                      Text("Volume: "),
                                      Text("Gravity:"),
                                      Text("Average Temp: ")
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value.solarSystemDetails?.name
                                                .toString() ??
                                            "",
                                      ),
                                      Text(
                                        value.solarSystemDetails?.bodyType
                                                .toString() ??
                                            "",
                                      ),
                                      Text(
                                        value.solarSystemDetails?.discoveredBy
                                                .toString() ??
                                            "",
                                      ),
                                      Text(
                                        value.solarSystemDetails?.moons?.length
                                                .toString() ??
                                            "",
                                      ),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: value.solarSystemDetails?.mass
                                                ?.massValue
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                            )),
                                        TextSpan(
                                            text: value.solarSystemDetails?.mass
                                                ?.massExponent
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFeatures: [
                                                  FontFeature.superscripts()
                                                ]))
                                      ])),
                                      Text("Volume: "),
                                      Text("Gravity:"),
                                      Text("Average Temp: ")
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
