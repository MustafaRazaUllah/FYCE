

import 'package:biticonapp/Common/AppBTN/primary_btn.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/FormFIelds/primary_text_field.dart';
import 'package:biticonapp/Common/Theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/AppBar/primary_app_bar.dart';
import '../../../Common/AppText/AppTextView.dart';
import '../../../Common/AppText/font_type.dart';
import '../../../RoutesAndBindings/app_routes.dart';
import 'Components/send_blance_tile.dart';


class SendView extends StatelessWidget {
  const SendView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Container(

        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            primaryAppBar(
              context: context,
              title: 'Send',
              isWallet: true
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
              child: sendBalanceTile(walletPrice: '1.23754', price: '1.12', converterPrice: 'CHF 23’189.21', context: context),
            ),
            const  Padding(
              padding:  EdgeInsets.only(bottom: 20,left: 10,right: 10),
              child:  CustomText(title: 'To', size: 12, fontWeight: FontWeights.bold,color: AppColor.greyText,fontType: FontType.Onest,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: PrimaryTextField(
                  isPass: false,
                  onChange: (value) {},
                  callback: (){
                    Get.toNamed(AppRoutes.qRScanner);
                  },
                  hintText: "Address",
                  readOnly: true,

                  sufixIcon: "assets/icons/Scan.png",
                  errorText: "Please Filled a Card Number",
                  width: AppConfig(context).width,
                  borderRadius: 10,
                  controller: TextEditingController(),
                  maxLine: 1,
                  maxLength: 14,
                  headingText: ""),
            ),
            Spacer(),
            PrimaryBTN(
              callback: () {
                Get.toNamed(AppRoutes.sendPreview, );

              },
              width: AppConfig(context).width,
              textCLR: AppColor.primaryColor,
              color: AppColor.white,
              height: 60,
              title: 'Preview ',
              borderRadius: 10,
              fontWeight: FontWeights.extraBold,
            ),
            SizedBox(height: 20,),


          ],
        ),
      ),
    );
  }
}