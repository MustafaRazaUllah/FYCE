


import 'package:biticonapp/App/Buy/View/Components/crypto_listing_tile.dart';
import 'package:biticonapp/Common/AppBTN/primary_btn.dart';
import 'package:biticonapp/Common/AppBar/primary_app_bar.dart';
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../RoutesAndBindings/app_routes.dart';

class RecoveryWalletKeyView extends StatelessWidget {
  const RecoveryWalletKeyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.strokeGrey,
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          children: [
            primaryAppBar(
              context: context,
              title: 'Recovery Phrase',
            ),
            const SizedBox(
              height: 40,
            ),
            const CustomText(
              title: "Your keys, your wallet!",
              color: AppColor.white,
              fontType: FontType.Onest,
              fontWeight: FontWeights.bold,
              size: 24,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              title: "Use your recovery phrase to restore access to your wallet if your device is lost, damaged or stolen. Therefore, it is important to keep your recovery phrase or private keys safe.",
              color: AppColor.white,
              fontType: FontType.Onest,
              fontWeight: FontWeights.regular,
              size: 16,
            ),
            const SizedBox(
              height: 40,
            ),
            cryptoListingTile(callback: () {

            }),
            const SizedBox(
              height: 10,
            ),
            cryptoListingTile(callback: () {

            }),
            const SizedBox(
              height: 10,
            ),
            cryptoListingTile(callback: () {

            }),
            Spacer(),

            PrimaryBTN(
              callback: () {


                // if (formKey.currentState!.validate()) {}
                Get.toNamed(AppRoutes.recoveryTermAndCondition );
              },
              width: AppConfig(context).width,
              textCLR: AppColor.primaryColor,
              color: AppColor.white,
              height: 60,
              title: "Start",
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
