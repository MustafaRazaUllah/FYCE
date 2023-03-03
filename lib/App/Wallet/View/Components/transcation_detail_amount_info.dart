import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Common/AppText/font_type.dart';

Widget transcationDetailAmountInfo(
    {String image = "assets/images/Bitcoin.png",
    String cryptoAmount = "0.2104876 BTC",
    String localCurrency = 'CHF 16’750.21'}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                // color: color,
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 10,
          ),
          CustomText(
            title: cryptoAmount,
            size: 22,
            fontWeight: FontWeights.bold,
            color: AppColor.white,
            fontType: FontType.Avenir,
          ),
        ],
      ),
      CustomText(
        title: localCurrency,
        size: 12,
        fontWeight: FontWeights.regular,
        color: AppColor.greyText,
        fontType: FontType.Onest,
      ),
    ],
  );
}
