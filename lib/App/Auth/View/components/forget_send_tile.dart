import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Common/AppText/AppTextView.dart';
import '../../../../Common/Constant/AppConfig.dart';
import '../../../../Common/Theme/colors.dart';

Widget forgetSendTile(
    {required BuildContext context,
    bool isSelected = true,
    required String text,
    VoidCallback? callback}) {
  return GestureDetector(
    onTap: callback,
    child: Container(
      height: AppConfig(context).height / 5,
      width: AppConfig(context).width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.white : Color(0xFF1E1D1D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              color: isSelected ? AppColor.green : AppColor.greyText,
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(color: AppColor.primaryColor, width: 5)
                  : Border(),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              CustomText(
                title: 'Send to your $text',
                fontWeight: FontWeights.extraBold,
                size: 16,
                color: isSelected ? AppColor.black : AppColor.white,
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                title: 'Password reset link has been sent to your\n$text',
                fontWeight: FontWeights.regular,
                size: 14,
                height: 1.5,
                color: isSelected ? AppColor.black : AppColor.white,
              ),
            ],
          )
        ],
      ),
    ),
  );
}
