


import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';

import 'package:flutter/material.dart';

import '../../../../Common/Theme/colors.dart';

Widget buyPreviewTile({required String text,required String text1,required BuildContext context,Color text1Color=AppColor.white}){
  return Column(
    children: [
      Row(
        children: [
          CustomText(title: text,fontWeight: FontWeights.bold,fontType: FontType.Onest,size: 14,color: AppColor.white,),
          const Spacer(),
          CustomText(title: text1,fontWeight: FontWeights.bold,fontType: FontType.Onest,size: 14,color:text1Color,),


        ],
      ),
      const SizedBox(height: 20),
      SizedBox(
          width: AppConfig(context).width / 2,
          child: const Divider(
            color: AppColor.greyText,
          )),
      const SizedBox(height: 20),
    ],
  );
}