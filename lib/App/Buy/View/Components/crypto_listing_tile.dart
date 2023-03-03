import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Common/AppText/AppTextView.dart';

Widget cryptoListingTile({required VoidCallback callback,String title="Bitcoin",String subTitle="BTC",String image="assets/images/Bitcoin.png",}) {
  return InkWell(
    onTap: callback,
    child: Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: AppColor.greyText.withOpacity(0.4)))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration:  BoxDecoration(
              image: DecorationImage(image: AssetImage(image)),
                color: AppColor.white, shape: BoxShape.circle,),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              CustomText(
                  title: title,
                  color: AppColor.white,
                  size: 17,
                  height: 1.5,
                  fontType: FontType.Avenir,
                  fontWeight: FontWeight.w300),
              CustomText(
                  title:subTitle ,
                  color: AppColor.white,
                  size: 14,
                  height: 1.5,
                  fontWeight: FontWeight.w500),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColor.white,
          )
        ],
      ),
    ),
  );
}
