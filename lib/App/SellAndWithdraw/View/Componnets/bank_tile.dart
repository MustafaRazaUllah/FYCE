import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Common/AppText/font_type.dart';
import '../../../../Common/Constant/AppConfig.dart';

Widget bankTile({
  VoidCallback? callback,
 required BuildContext context,
}) {
  return InkWell(
    onTap: callback,
    child: Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: AppColor.greyText.withOpacity(0.4)))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
            width: 35,
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Image(
                image: AssetImage("assets/icons/Bank.png"),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              const CustomText(
                  title: "BANK ACCOUNT NAME",
                  color: AppColor.white,
                  size: 17,
                  height: 1.5,
                  fontType: FontType.Avenir,
                  fontWeight: FontWeight.w300),
              SizedBox(
                width: AppConfig(context).width-100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:const [
                     CustomText(
                        title: "Daily limit CHF 500.-",
                        color: AppColor.greyText,
                        size: 14,
                        height: 1.5,
                        fontType: FontType.Avenir,
                        fontWeight: FontWeight.w300),

                    CustomText(
                        title: "INSTANT",
                        color: AppColor.onboard,
                        size: 14,
                        height: 1.5,
                        fontType: FontType.Avenir,
                        fontWeight: FontWeight.w300),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
