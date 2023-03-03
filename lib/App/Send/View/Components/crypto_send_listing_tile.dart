import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Common/AppText/AppTextView.dart';

Widget cryptoSendListingTile(
    {required VoidCallback callback, bool isSelected = false}) {
  return InkWell(
    onTap: callback,
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: isSelected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(isSelected ? 10 : 0),
              color: AppColor.primaryColor.withOpacity(0.3))
          : const BoxDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Bitcoin.png")),
              color: AppColor.white,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomText(
                  title: "Bitcoin",
                  color: AppColor.white,
                  size: 17,
                  height: 1.5,
                  fontType: FontType.Avenir,
                  fontWeight: FontWeight.w300),
              CustomText(
                  title: "BTC",
                  color: AppColor.white,
                  size: 14,
                  height: 1.5,
                  fontWeight: FontWeight.w500),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Row(
                children: const [
                  Image(
                    image: AssetImage("assets/icons/navBar/wallet.png"),
                    height: 10,
                    color: AppColor.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomText(
                      title: "1.23754",
                      color: AppColor.white,
                      size: 12,
                      fontType: FontType.Onest,
                      height: 1.5,
                      fontWeight: FontWeights.regular),
                ],
              ),
              const CustomText(
                  title: "CHF 3’189.21",
                  color: AppColor.greyText,
                  size: 12,
                  fontType: FontType.Onest,
                  height: 1.5,
                  fontWeight: FontWeights.regular),
            ],
          )
        ],
      ),
    ),
  );
}
