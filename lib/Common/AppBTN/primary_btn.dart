import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PrimaryBTN extends StatelessWidget {
  final double width;
  final String title;
  final VoidCallback? callback;
  final double? height;
  final double? fontSize;
  final double borderRadius;
  final bool isBorder;
  final bool isSecondary;
  final Color color;
  final Color textCLR;
  final bool isOnBoard;
  final bool loading;
  final bool isActive;
  final FontWeight fontWeight;
  const PrimaryBTN({
    super.key,
    this.borderRadius = 16,
    this.isSecondary = false,
    required this.callback,
    this.color = AppColor.primaryColor,
    this.fontSize,
    required this.fontWeight,
    this.height,
    this.loading = false,
    this.isActive = true,
    this.isBorder = false,
    this.isOnBoard = false,
    this.textCLR = AppColor.white,
    required this.title,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isActive && !loading) {
          callback!();
        }
      },
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: height ?? SizeConfig.screenWidth * 0.15,
        width: width,
        decoration: BoxDecoration(
          color: isActive ? color : AppColor.greyText,
          border: isBorder
              ? Border.all(
                  color: AppColor.greyText,
                  width: 1,
                )
              : const Border(),
          borderRadius: isOnBoard
              ? const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
              : BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: loading
              ? SizedBox(
                  height: 10,
                  child: SpinKitThreeInOut(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: index.isEven
                              ? AppColor.greyText.withOpacity(0.5)
                              : AppColor.primaryColor.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      );
                    },
                  ),
                )
              : CustomText(
                  title: title,
                  color: textCLR,
                  size: fontSize ?? SizeConfig.screenWidth * 0.04,
                  fontType: FontType.Avenir,
                  fontWeight: fontWeight),
        ),
      ),
    );
  }
}
