import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../Common/Theme/colors.dart';

Widget walletTile({
  required String icon,
  required String title,
  required String currencyname,
  required String title2,
  required String riseValue,
  required Color backgroundColor,
  required Color textColor,
  VoidCallback? callback,
}) {
  return GestureDetector(
    onTap: callback,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
        // border: Border.all(
        //   color: AppColor.greyText,
        // ),
      ),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(
                title: title,
                size: SizeConfig.screenWidth * 0.055,
                fontWeight: FontWeight.w900,
                color: textColor,
                fontType: FontType.Avenir,
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                height: SizeConfig.screenWidth * 0.075,
                width: SizeConfig.screenWidth * 0.075,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(icon),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(
                title: currencyname,
                size: SizeConfig.screenWidth * 0.036,
                fontWeight: FontWeight.w400,
                color: textColor,
                fontType: FontType.Avenir,
              ),
              const SizedBox(height: 7),
              CustomText(
                title: 'CHF 3’189.21',
                size: SizeConfig.screenWidth * 0.036,
                fontWeight: FontWeight.w400,
                color: textColor,
                fontType: FontType.Avenir,
              ),
              const SizedBox(height: 7),
              CustomText(
                title: title2,
                size: SizeConfig.screenWidth * 0.036,
                fontWeight: FontWeight.w400,
                color: AppColor.greyLight,
                fontType: FontType.Avenir,
              ),
              const SizedBox(height: 7),
              CustomText(
                title: riseValue, //'+12.43%',
                size: SizeConfig.screenWidth * 0.036,
                fontWeight: FontWeight.w400,
                color: AppColor.black54color,
                fontType: FontType.Avenir,
              ),
            ],
          )
        ],
      ),
    ),
  );
}


// Widget walletTile({
//   required String icon,
//   required String title,
//   required String title2,
//   required String riseValue,
//   VoidCallback? callback,
// }) {
//   return InkWell(
//     onTap: callback,
//     child: Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(4),
//           border: Border.all(color: AppColor.greyText)),
//       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 alignment: Alignment.center,
//                 height: SizeConfig.screenWidth * 0.09,
//                 width: SizeConfig.screenWidth * 0.09,
//                 decoration: BoxDecoration(
//                     color: Colors.transparent,
//                     shape: BoxShape.circle,
//                     // color: color,
//                     image: DecorationImage(
//                         image: AssetImage(icon), fit: BoxFit.cover)),
//               )
//             ],
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomText(
//                 title: title,
//                 size: SizeConfig.screenWidth * 0.04,
//                 fontWeight: FontWeight.w500,
//                 color: AppColor.white,
//                 fontType: FontType.Avenir,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               CustomText(
//                 title: 'CHF 3’189.21',
//                 size: SizeConfig.screenWidth * 0.034,
//                 fontWeight: FontWeight.w400,
//                 color: AppColor.white,
//                 fontType: FontType.Avenir,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               CustomText(
//                 title: title2,
//                 // size: 14,
//                 // fontWeight: FontWeights.extraBold,
//                 size: SizeConfig.screenWidth * 0.032,
//                 fontWeight: FontWeight.w700,
//                 color: AppColor.greyText,
//                 fontType: FontType.Avenir,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               CustomText(
//                 title: riseValue, //'+12.43%',
//                 // size: 14,
//                 // fontWeight: FontWeights.medium,
//                 size: SizeConfig.screenWidth * 0.031,
//                 fontWeight: FontWeight.w500,
//                 color: AppColor.greyText.withOpacity(0.6),
//                 fontType: FontType.Avenir,
//               ),
//             ],
//           )
//         ],
//       ),
//     ),
//   );
// }
