import 'package:explore_universe/utils/colors.dart';
import 'package:explore_universe/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import '../model/links_model.dart';

class References extends StatefulWidget {
  const References({Key? key}) : super(key: key);

  @override
  State<References> createState() => _ReferencesState();
}

class _ReferencesState extends State<References> {
  static List<Links> link = [
    Links(name: "Freepik", link: "http://www.freepik.com"),
    Links(name: "antonioli / Freepik", link: "http://www.freepik.com")
  ];
  void _launchUrl(_url) async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

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
          "References",
          style: bigBoldWhiteTextStyle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "This application is highly inspired from Info Astronomy App. You can click this banner to check their website",
                  style: regularWhiteTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      _launchUrl(Uri.parse("https:/www.infoastronomy.org"));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/info_astronomy.webp"),
                            fit: BoxFit.fill,
                            opacity: .5),
                      ),
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "For icons and pictures, I get it from freepik and pexels. Here is the links:",
                  style: regularWhiteTextStyle,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    itemBuilder: (BuildContext context, int index) {
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: ListTile(
                          title: Text(
                            link[index].name.toString(),
                            style: regularWhiteTextStyle,
                          ),
                          trailing: Icon(
                            Icons.arrow_right_rounded,
                            color: Colors.white,
                          ),
                          onTap: () {
                            _launchUrl(Uri.parse(link[index].link));
                          },
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        thickness: 1,
                        color: Colors.white,
                      );
                    },
                    itemCount: link.length),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "For Apod (Astronomy photo of the day), Im using NASA Open API that i get from their website. You can click this banner to get one too",
                  style: regularWhiteTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => _launchUrl(Uri.parse("https://api.nasa.gov/")),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage("assets/images/apod.jpeg"),
                            fit: BoxFit.fill,
                            opacity: .5),
                      ),
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "For Solar System Details , Im using The Solar System OpenData. You can click this banner to see the documentation ",
                  style: regularWhiteTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => _launchUrl(
                        Uri.parse("https://api.le-systeme-solaire.net/en/")),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/solar_system_api.png"),
                            fit: BoxFit.fill,
                            opacity: .5),
                      ),
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
