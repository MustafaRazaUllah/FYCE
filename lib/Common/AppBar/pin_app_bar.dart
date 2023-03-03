// ignore_for_file: must_be_immutable

import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';

class PinAppBar extends StatelessWidget {
  bool isBackIcon;

  String headingText;
  String subHeadingText;
  String subHeadingText1;

  PinAppBar({Key? key, this.isBackIcon = false,required this.headingText,required this.subHeadingText,required this.subHeadingText1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage(
                'assets/logo/logo.png',
              ),
              height: 30,
              width: 57,
            ),
            const Spacer(),
            isBackIcon
                ? InkWell(
              onTap: (){
                Navigator.pop(context);
              },
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration:const  BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.greyText),
                      child: const Padding(
                        padding:  EdgeInsets.all(15),
                        child:  Image(image:AssetImage("assets/icons/cancel.png"),height: 20,width: 20,),
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
            size: 24,
            fontType: FontType.Onest,
            fontWeight: FontWeights.bold),
        const SizedBox(
          height: 20,
        ),
        CustomText(
            title: subHeadingText,
            color: AppColor.white,
            size: 24,
            fontType: FontType.Onest,
            fontWeight: FontWeights.bold),
        const SizedBox(
          height: 10,
        ),
        CustomText(
            title:subHeadingText1,
            color: AppColor.greyText,
            height: 2.0,
            fontType: FontType.Onest,
            size: 14,
            fontWeight: FontWeights.regular),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
