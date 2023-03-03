



import 'package:flutter/cupertino.dart';

import '../../../../Common/AppText/AppTextView.dart';
import '../../../../Common/Theme/colors.dart';

Widget  verifiedTypeSubTile({required bool isSelected, bool isActive=false,required String text}){
  return  Row(
    children:  [
       Image(image:const AssetImage('assets/icons/checkbox.png',),height: 10,width: 10,color:isActive?AppColor.green:AppColor.greyText ,),
      const  SizedBox(width: 10,),
      CustomText(title: text,fontWeight: FontWeights.regular,size: 12,color:isSelected? AppColor.black:AppColor.greyLightShade ,),
    ],
  );
}