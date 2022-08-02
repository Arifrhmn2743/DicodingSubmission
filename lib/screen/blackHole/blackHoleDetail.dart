import 'package:explore_universe/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/colors.dart';

class BlackHoleDetail extends StatefulWidget {
  // const BlackHoleDetail({Key? key}) : super(key: key);
  String id, name, image, desc, link;
  BlackHoleDetail({
    required this.id,
    required this.image,
    required this.name,
    required this.desc,
    required this.link,
  });

  @override
  State<BlackHoleDetail> createState() => _BlackHoleDetailState();
}

class _BlackHoleDetailState extends State<BlackHoleDetail> {
  void _launchUrl(_url) async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
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
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Text(
                        "Description :",
                        style: titleWhiteTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      widget.desc,
                      style: regularWhiteTextStyle,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          "Source: ",
                          style: regularWhiteTextStyle,
                        ),
                        Expanded(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => _launchUrl(Uri.parse(widget.link)),
                              child: Text(
                                widget.link,
                                style: underlineWhiteTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
