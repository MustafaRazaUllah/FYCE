



import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../Common/Theme/colors.dart';

Widget drawerSecurityTile({required String heading,required bool value}){
  return  Row(
    children: [
      CustomText(
          title: heading,
          size: 14,
          fontWeight: FontWeights.extraBold,
          fontType: FontType.Avenir,
          color: AppColor.white),
      const Spacer(),
      FlutterSwitch(
        height: 25.0,
        width: 45.0,
        padding: 4.0,
        toggleSize: 20.0,
        borderRadius: 30.0,
        inactiveColor: AppColor.greyLightShade,
        activeColor: AppColor.switchColor,
        value: value,
        onToggle: (value) {

        },
      ),
    ],
  );
}