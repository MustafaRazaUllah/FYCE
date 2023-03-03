




import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';

Widget homeInfoTile({required String text,required String text1}){
  return  Padding(
    padding: const EdgeInsets.only(left: 30,right: 30),
    child: Row(
      children: [
        CustomText(
            title: text,
            color: AppColor.white,
            size: 12,
            fontType: FontType.Onest,
            fontWeight: FontWeights.regular),
        Spacer(),
        CustomText(
            title: text1,
            color: AppColor.greyText,
            size: 12,
            fontType: FontType.Onest,
            fontWeight: FontWeights.regular),
      ],
    ),
  );
}