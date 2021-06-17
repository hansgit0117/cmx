import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/slide_model.dart';

class SlideItemWidget extends StatelessWidget {
  final Slide slide;

  const SlideItemWidget({
    this.slide,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(Directionality.of(context) == TextDirection.rtl ? math.pi : 0),
          child: Image.asset(
              slide.localImagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 310,
            ),
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
            child: SizedBox(
              width: 180,
              child: Column(
                children: [
                  Text(
                    slide.title,
                    style: Get.textTheme.headline5.merge(TextStyle(color: slide.textColor)),
                    maxLines: 3,
                  ),
                  // Text(
                  //   slide.description,
                  //   style: Get.textTheme.bodyText1.merge(TextStyle(color: slide.textColor)),
                  //   maxLines: 3,
                  // ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
              ),
            )),
      ],
    );
  }
}
