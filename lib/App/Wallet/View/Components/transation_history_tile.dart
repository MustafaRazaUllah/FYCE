import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget transactionHistory(
    {String heading = "Bought Bitcoin",
    String btcPrice = "0.02940003 BTC",
    String heading2 = "Using PaymentMethod",
    String localCurrency = "CHF 540.00",
    Color localCurrencyColor = AppColor.onboard,
      VoidCallback ?callback,
    }) {
  return InkWell(
    onTap: callback,
    child: Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 15),
      child: Column(
        children: [
          Row(
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
                title: btcPrice,
                color: AppColor.greyLightShade,
                fontType: FontType.Onest,
                fontWeight: FontWeights.bold,
                size: 14,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CustomText(
                title: heading2,
                color: AppColor.greyText,
                fontType: FontType.Onest,
                fontWeight: FontWeights.regular,
                size: 12,
              ),
              const Spacer(),
              CustomText(
                title: localCurrency,
                color: AppColor.switchColor,
                fontType: FontType.Onest,
                fontWeight: FontWeights.bold,
                size: 12,
              ),
            ],
          )
        ],
      ),
    ),
  );
}
