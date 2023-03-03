


import 'package:biticonapp/Common/AppBTN/radio_button.dart';
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget nativeCurrencyTile({required String text,required bool isSelected,VoidCallback ? callback}){
  return  InkWell(
    onTap: callback,
    child: Container(
      padding: const EdgeInsets.only(bottom: 20,left: 20),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: AppColor.greyText.withOpacity(0.4)))),
      child: Row(
        children: [
          CustomText(
            title:text,
            color: AppColor.white,
            fontType: FontType.Onest,
            fontWeight: FontWeights.bold,
            size: 14,
          ),
          Spacer(),
          radioButton(isSelected: isSelected,callback:callback ),
        ],
      ),
    ),
  );
}