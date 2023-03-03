import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../../Common/AppText/font_type.dart';

Widget paymentMethodTile({required BuildContext context,required String title,required String image}) {
  return Container(
    padding: const EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: AppColor.greyText.withOpacity(0.4)))),
    child: Row(
      children: [
        Image(
          image: AssetImage(image),
          width: 40,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title: title,
              fontWeight: FontWeight.w300,
              size: 17,
              fontType: FontType.Avenir,
              color: AppColor.white,
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: AppConfig(context).width-100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                   CustomText(
                    title: "Daily limit CHF 500.-",
                    fontWeight: FontWeights.regular,
                    size: 14,
                    fontType: FontType.Avenir,
                    color: AppColor.greyText,
                  ),

                   CustomText(
                    title: "INSTANT",
                    fontWeight: FontWeight.w300,
                    size: 12,
                    fontType: FontType.Avenir,
                    color: AppColor.onboard,
                  ),
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}
