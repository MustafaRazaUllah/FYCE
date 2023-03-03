// ignore_for_file: must_be_immutable

import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';

class OnBoardScreen1 extends StatelessWidget {
  String heading;
  String subHeading;

  OnBoardScreen1({Key? key, required this.heading, required this.subHeading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomText(
            alignment: TextAlign.center,
            title: heading,
            color: AppColor.white,
            size: SizeConfig.screenWidth * 0.06,
            fontWeight: FontWeights.extraBold),
        CustomText(
            alignment: TextAlign.center,
            title: subHeading,
            color: AppColor.white,
            height: 1.4,
            size: SizeConfig.screenWidth * 0.035,
            fontWeight: FontWeights.regular),
      ],
    );
  }
}
