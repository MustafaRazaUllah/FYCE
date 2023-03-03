import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget drawerGeneralTile({
  required String heading,
  required String subHeading,
  VoidCallback? callback,
  bool isActiveArrow = true,
  Color textcolor = AppColor.white,
}) {
  return InkWell(
    onTap: callback,
    child: Row(
      children: [
        CustomText(
          title: heading,
          size: 15,
          fontWeight: FontWeights.extraBold,
          fontType: FontType.Avenir,
          color: textcolor,
        ),
        const Spacer(),
        CustomText(
            title: subHeading,
            size: 14,
            fontWeight: FontWeights.regular,
            fontType: FontType.Onest,
            color: AppColor.greyLightShade),
        const SizedBox(
          width: 10,
        ),
        Visibility(
          visible: isActiveArrow,
          child: const Icon(
            Icons.arrow_forward_ios_sharp,
            color: AppColor.white,
            size: 15,
          ),
        )
      ],
    ),
  );
}
