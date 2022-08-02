import 'package:explore_universe/provider/mainProvider.dart';
import 'package:explore_universe/utils/colors.dart';
import 'package:explore_universe/utils/const.dart';
import 'package:explore_universe/widget/responsive.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:image_network/image_network.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Apod extends StatefulWidget {
  const Apod({Key? key}) : super(key: key);

  @override
  State<Apod> createState() => _ApodState();
}

class _ApodState extends State<Apod> with TickerProviderStateMixin {
  late final AnimationController _controller;
  void getData() async {
    final getData = Provider.of<MainProvider>(context, listen: false);
    await getData.getApod();
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
    );
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: ColorPallet.primary,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "APOD",
            style: bigBoldWhiteTextStyle,
          ),
        ),
        body: Consumer<MainProvider>(builder: (context, value, child) {
          return SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: value.isLoading == true
                ? Center(
                    child: LottieBuilder.asset(
                    "assets/images/loading-rocket.json",
                    controller: _controller,
                    onLoaded: (composition) {
                      _controller
                        ..duration = composition.duration
                        ..forward().whenComplete(() {
                          setState(() {
                            value.isLoading = false;
                          });
                        });
                    },
                  ))
                : Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Text(
                              value.data?.title.toString() ?? "",
                              style: titleWhiteTextStyle,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            FullScreenWidget(
                              child: Hero(
                                tag: "Photo",
                                child: ResponsiveWidget.isSmallScreen(context)
                                    ? FancyShimmerImage(
                                        boxFit: BoxFit.cover,
                                        imageUrl:
                                            value.data?.url.toString() ?? "")
                                    : value.isLoading == true
                                        ? CircularProgressIndicator()
                                        : ImageNetwork(
                                            image: value.data?.url.toString() ??
                                                "",
                                            height: 400,
                                            width: 400),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            )
                          ],
                        ),
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
                              Text(
                                "Copyright to: ${value.data?.copyright.toString()}",
                                style: titleWhiteTextStyle,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Date : ${value.data?.date.toString()}",
                                style: titleWhiteTextStyle,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Description :",
                                style: titleWhiteTextStyle,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                value.data?.explanation ?? "",
                                style: regularWhiteTextStyle,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
          )));
        }),
      );
    });
  }
}
