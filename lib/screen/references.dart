import 'package:explore_universe/utils/colors.dart';
import 'package:explore_universe/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

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
      backgroundColor: ColorPallet.darkPurple,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "References :",
                      style: bigBoldWhiteTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "This application is highly inspired from Info Astronomy App. You can click this banner to check their app in playstore",
                      style: regularWhiteTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () => StoreRedirect.redirect(
                          androidAppId: 'com.info.astronomy.app'),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          "assets/images/info_astronomy.webp",
                          fit: BoxFit.fitWidth,
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 6,
                      child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
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
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              thickness: 1,
                              color: Colors.white,
                            );
                          },
                          itemCount: link.length),
                    ),
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
                    GestureDetector(
                      onTap: () =>
                          _launchUrl(Uri.parse("https://api.nasa.gov/")),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          "assets/images/apod.jpeg",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
