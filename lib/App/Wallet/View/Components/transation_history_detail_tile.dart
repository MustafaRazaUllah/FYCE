import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget transactionHistoryDetailTile(
    {String heading = "Reference",

    String heading2 = "BB120342",
      FontWeight weight=FontWeights.regular,
    Color localCurrencyColor = AppColor.greyLightShade,
      VoidCallback ?callback,
    }) {
  return InkWell(
    onTap: callback,
    child: Row(
      children: [
        CustomText(
          title: heading,
          color: AppColor.white,
          fontType: FontType.Onest,
          fontWeight: FontWeights.bold,
          size: 14,
        ),
        const Spacer(),
        CustomText(
          title: heading2,
          color: localCurrencyColor,
          fontType: FontType.Onest,
          fontWeight: weight,
          size: 14,
        ),
      ],
    ),
  );
}
