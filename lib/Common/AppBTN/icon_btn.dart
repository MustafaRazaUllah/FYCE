
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';

class IconBTN extends StatelessWidget {
  final double width;
  final String title;
  final VoidCallback? callback;
  final double height;
  final double fontSize;
  final double borderRadius;
  final bool isBorder;
  final MainAxisAlignment mainAxisAlignment;
  final Color color;
  final Color textCLR;
  final FontWeight fontWeight;
  final String iconImg;
  final double iconSize;
  const IconBTN({
    super.key,
    required this.iconImg,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.borderRadius = 10,
    this.iconSize = 13,
    required this.callback,
    this.color = AppColor.primaryColor,
    this.fontSize = 16,
    required this.fontWeight,
    this.height = 54,
    this.isBorder = false,
    this.textCLR = AppColor.white,
    required this.title,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color,
            border: isBorder
                ? Border.all(
                    color: AppColor.primaryColor,
                    width: 1,
                  )
                : const Border(),
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            CustomText(
                title: title,
                color: textCLR,
                size: fontSize,
                fontWeight: fontWeight),
            const SizedBox(
              width: 10,
            ),
            Image(
              image: AssetImage(iconImg),
              height: iconSize,
              width: iconSize,
              color: textCLR,
            )
          ],
        ),
      ),
    );
  }
}
