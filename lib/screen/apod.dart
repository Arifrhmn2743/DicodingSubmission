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
        extendBodyBehindAppBar: true,
        backgroundColor: ColorPallet.primary,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: value.isLoading == true
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
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ResponsiveWidget.isSmallScreen(context)
                            ? FancyShimmerImage(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 2,
                                boxFit: BoxFit.fill,
                                imageUrl: value.data?.url.toString() ?? "")
                            : ImageNetwork(
                                image: value.data?.url.toString() ?? "",
                                height: 400,
                                width: 400),
                        Positioned(
                          top: 380,
                          left: 8,
                          child: Text(
                            value.data?.title.toString() ?? "",
                            style: titleWhiteTextStyle,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: ColorPallet.light,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description",
                              style: titleWhiteTextStyle,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              value.data?.explanation ?? "",
                              style: regularWhiteTextStyle,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Copyright : ${value.data?.copyright.toString()}, ${value.data?.date.toString()}",
                              style: titleWhiteTextStyle,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
      );
    });
  }
}
