


import 'package:biticonapp/App/Drawer/View/Components/verified_type_sub_tile.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Common/AppText/AppTextView.dart';
import '../../../../Common/Constant/AppConfig.dart';
import '../../../../Common/Theme/colors.dart';

Widget accountVerifiedTypeTile({required BuildContext context,bool isSelected=true,VoidCallback ? callback}){
  return InkWell(
    onTap:callback ,
    child: Container(
      height: AppConfig(context).height/5,
      width:  AppConfig(context).width,
      padding:const  EdgeInsets.all(20),
      decoration: BoxDecoration(
        color:isSelected? AppColor.white: AppColor.greyText.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [

          CustomText(title: 'Verified',fontWeight: FontWeights.bold,size: 16,color:isSelected? AppColor.black:AppColor.greyLightShade ,),
          const SizedBox(height: 2,),
          CustomText(title: 'Unlimited purchases of Cryptocurrencies',fontWeight: FontWeights.bold,size: 12,color:isSelected? AppColor.black:AppColor.greyLightShade,fontType: FontType.Onest, ),
        const SizedBox(height: 5,),

          verifiedTypeSubTile(isSelected: isSelected,isActive: true, text: 'Account creation'),
          const SizedBox(height: 5,),

          verifiedTypeSubTile(isSelected: isSelected,isActive: false, text: 'Personal Details'),
          const SizedBox(height: 5,),

          verifiedTypeSubTile(isSelected: isSelected,isActive: false, text: 'ID Verification'),
          const SizedBox(height: 5,),

          verifiedTypeSubTile(isSelected: isSelected,isActive: false, text: 'Address Verification'),

          const SizedBox(height: 5,),

        ],
      ),
    ),
  );
}