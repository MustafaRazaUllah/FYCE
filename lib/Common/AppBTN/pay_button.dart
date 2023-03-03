import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget payButton({
  required String icon,
  required String title,
  VoidCallback? callback,
}) {
  return GestureDetector(
    onTap: callback,
    child: Column(
      children: [
        Image(
          image: AssetImage(icon),
          height: 16,
          width: 16,
        ),
        const SizedBox(
          height: 7,
        ),
        CustomText(
          title: title,
          color: AppColor.white,
          size: 12,
          fontType: FontType.Avenir,
          fontWeight: FontWeights.extraBold,
        ),
      ],
    ),
  );
}
