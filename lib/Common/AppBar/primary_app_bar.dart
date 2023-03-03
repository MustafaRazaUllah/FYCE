import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';

import '../AppText/AppTextView.dart';
import '../AppText/font_type.dart';

Widget primaryAppBar({
  required BuildContext context,
  required String title,
  bool isWallet = false,
  double fontSize = 18,
  FontType fontType = FontType.Onest,
  FontWeight fontWeights = FontWeights.bold,
}) {
  return Row(
    mainAxisAlignment:
        isWallet ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.white,
          )),
      // isWallet?SizedBox(
      //   width: 20,
      // ):SizedBox.shrink(),
      CustomText(
        title: title,
        color: AppColor.white,
        fontType: fontType,
        fontWeight: fontWeights,
        size: fontSize,
      ),
      isWallet
          ? SizedBox.shrink()
          : SizedBox(
              width: 30,
            )
    ],
  );
}
