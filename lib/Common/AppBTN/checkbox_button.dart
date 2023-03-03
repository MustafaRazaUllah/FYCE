import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';

Widget checkBoxButton({required bool isSelected, VoidCallback? callback}) {
  return InkWell(
    onTap: callback,
    child: Container(
      width: SizeConfig.screenWidth * 0.07,
      height: SizeConfig.screenWidth * 0.07,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: isSelected
          ? const Padding(
              padding: EdgeInsets.all(6),
              child: Image(
                image: AssetImage('assets/icons/tick.png'),
              ),
            )
          : const SizedBox.shrink(),
    ),
  );
}
