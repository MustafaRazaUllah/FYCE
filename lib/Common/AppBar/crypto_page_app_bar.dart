



import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';

import '../AppText/AppTextView.dart';

Widget cryptoPageAppBar({String image="assets/images/Bitcoin.png",String title="Bitcoin BTC",String percentage="1.48%",}){
  return  Padding(
    padding: const EdgeInsets.only(left: 20,right: 20),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              height: 22,
              width: 22,
              decoration:  BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image)),
                color: AppColor.white,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
             CustomText(
                title:title ,
                color: AppColor.white,
                size: 16,
                fontType: FontType.Onest,
                fontWeight: FontWeight.bold),
            const Spacer(),
            Row(
              children:  [
                const  Icon(Icons.arrow_drop_up_outlined,color: AppColor.onboard,),
                CustomText(
                    title: percentage,
                    color: AppColor.onboard,
                    size: 12,
                    fontType: FontType.Onest,
                    fontWeight: FontWeights.extraBold)
              ],
            )

          ],
        ),
        const SizedBox(height: 5,),
        Row(
          children: const [
            CustomText(
                title: "CHF",
                color: AppColor.greyText,
                size: 18,
                fontType: FontType.Onest,
                fontWeight: FontWeight.bold),
            SizedBox(width: 5,),
            CustomText(
                title: "16’540.00",
                color: AppColor.orange,
                size: 18,
                fontType: FontType.Onest,
                fontWeight: FontWeight.bold),
          ],
        )
      ],
    ),
  );
}