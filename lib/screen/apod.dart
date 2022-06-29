import 'package:explore_universe/provider/mainProvider.dart';
import 'package:explore_universe/utils/const.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:provider/provider.dart';

class Apod extends StatefulWidget {
  const Apod({Key? key}) : super(key: key);

  @override
  State<Apod> createState() => _ApodState();
}

class _ApodState extends State<Apod> {
  void getData() async {
    final getData = Provider.of<MainProvider>(context, listen: false);
    await getData.getApod();
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, value, child) {
      var size = MediaQuery.of(context).size;
      return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/bg.png"))),
            ),
            SafeArea(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "APOD (Astronomy Picture of the Day)",
                              style: bigBoldTextStyle,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            FullScreenWidget(
                              child: Hero(
                                tag: "Photo",
                                child: FancyShimmerImage(
                                    boxFit: BoxFit.cover,
                                    imageUrl: value.data?.url.toString() ?? ""),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              value.data?.title.toString() ?? "",
                              style: bigBoldTextStyle,
                            ),
                            SizedBox(
                              height: 8,
                            )
                          ],
                        ),
                      )),
                ),
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Copyright to: ${value.data?.copyright.toString()}",
                              style: titleTextStyle,
                            ),
                            Text(
                              "Date : ${value.data?.date.toString()}",
                              style: titleTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Description :",
                          style: titleTextStyle,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(value.data?.explanation ?? "")
                      ],
                    ),
                  ),
                ))
              ],
            ))
          ],
        ),
      );
    });
  }
}
