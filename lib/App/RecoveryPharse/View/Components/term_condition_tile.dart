



import 'package:biticonapp/Common/AppBTN/checkbox_button.dart';
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';

Widget recoveryTermConditionTile({required BuildContext context,required String text,required bool isSelected,VoidCallback ? callback }){
  return  Container(
    padding: const EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: AppColor.greyText.withOpacity(0.4)))),
    child: Row(
      children: [

        SizedBox(
          width:AppConfig(context).width/1.3,
          child:  CustomText(
            title:text,
            color: AppColor.white,
            fontType: FontType.Onest,
            fontWeight: FontWeights.regular,
            size: 14,
          ),

        ),
        Spacer(),
        checkBoxButton(isSelected: isSelected,callback:callback),

      ],
    ),
  );
}