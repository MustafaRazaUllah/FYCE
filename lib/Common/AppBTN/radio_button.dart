


import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget radioButton({required bool isSelected,VoidCallback ? callback}){
  return InkWell(
    onTap: callback,
    child: Container(
      height: 22,
      width: 22,
      decoration: BoxDecoration(
          color:isSelected? AppColor.switchColor:AppColor.greyText,
          shape: BoxShape.circle,
          border:isSelected? Border.all(
              color: AppColor.primaryColor,
              width: 5
          ):Border()
      ),
    ),
  );
}