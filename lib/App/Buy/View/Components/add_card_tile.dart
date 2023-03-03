import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Common/AppText/font_type.dart';

Widget addCardTile({VoidCallback? callback,bool isBank=false}) {
  return InkWell(
    onTap: callback,
    child: Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: AppColor.greyText.withOpacity(0.4)))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColor.greyText),
            child: const Icon(
              Icons.add,
              color: AppColor.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              isBank?   const CustomText(
                  title: "Add Withdrawal Bank Account ",
                  color: AppColor.white,
                  size: 17,
                  height: 1.5,
                  fontType: FontType.Avenir,
                  fontWeight: FontWeight.w300): const CustomText(
                  title: "Add Payment Method",
                  color: AppColor.white,
                  size: 17,
                  height: 1.5,
                  fontType: FontType.Avenir,
                  fontWeight: FontWeight.w300),
              isBank? SizedBox.shrink() :  Row(
                children: const [
                  Image(
                    image: AssetImage('assets/icons/visa.png'),
                    width: 40,
                  ),
                  SizedBox(width: 10,),
                  Image(
                    image: AssetImage('assets/icons/master.png'),
                    width: 40,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}
