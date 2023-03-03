


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Common/AppText/AppTextView.dart';
import '../../../../Common/Constant/AppConfig.dart';
import '../../../../Common/Theme/colors.dart';

Widget accountBasicTypeTile({required BuildContext context,bool isSelected=true,VoidCallback ? callback}){
  return InkWell(
    onTap:callback ,
    child: Container(
      height: AppConfig(context).height/5,
      width:  AppConfig(context).width,
      padding:const  EdgeInsets.all(20),
      decoration: BoxDecoration(
        color:isSelected? AppColor.white:const Color(0xFF1E1D1D),
        borderRadius: BorderRadius.circular(16),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [

          Row(
            children: [
              CustomText(title: 'Basic',fontWeight: FontWeights.bold,size: 16,color:isSelected? AppColor.black:AppColor.white ,),
              Spacer(),
              Container(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 8),
                decoration: BoxDecoration(
                  color: AppColor.switchColor,
                  borderRadius: BorderRadius.circular(20)
                  
                ),

                child: const CustomText(title: "Active",fontWeight: FontWeights.extraBold,size: 12,),
              )

            ],
          ),
          const SizedBox(height: 10,),
          CustomText(title: 'Buying of Cryptocurrencies limited up to \n500\$ per day.',fontWeight: FontWeights.bold,size: 12,height: 1.5,color:isSelected? AppColor.black:AppColor.white ,),
        ],
      ),
    ),
  );
}