// ignore_for_file: must_be_immutable

import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';

class AuthAppBar extends StatelessWidget {
  bool isBackIcon;
  String headingText;
  String subHeadingText;

  AuthAppBar({
    Key? key,
    this.isBackIcon = false,
    required this.headingText,
    required this.subHeadingText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(
                'assets/logo/logo.png',
              ),
              height: 30,
              width: SizeConfig.screenWidth * 0.18,
            ),
            const Spacer(),
            isBackIcon
                ? GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColor.greyText),
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Image(
                          image: AssetImage("assets/icons/cancel.png"),
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        isBackIcon
            ? const SizedBox.shrink()
            : const SizedBox(
                height: 10,
              ),
        CustomText(
            title: headingText,
            color: AppColor.white,
            size: SizeConfig.screenWidth * 0.05, //24,
            fontType: FontType.Onest,
            fontWeight: FontWeights.bold),
        const SizedBox(
          height: 10,
        ),
        CustomText(
            title: subHeadingText,
            color: AppColor.greyText,
            height: 2.0,
            fontType: FontType.Onest,
            size: SizeConfig.screenWidth * 0.035, //14,
            fontWeight: FontWeights.regular),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
