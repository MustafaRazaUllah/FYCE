import 'package:biticonapp/App/Buy/View/Components/crypto_listing_tile.dart';
import 'package:biticonapp/App/RecoveryPharse/View/Components/term_condition_tile.dart';
import 'package:biticonapp/Common/AppBTN/checkbox_button.dart';
import 'package:biticonapp/Common/AppBTN/primary_btn.dart';
import 'package:biticonapp/Common/AppBar/primary_app_bar.dart';
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/FormFIelds/primary_text_field.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/Constant/AppConfig.dart';
import '../../../RoutesAndBindings/app_routes.dart';

class RecoveryTermAndCondition extends StatelessWidget {
  const RecoveryTermAndCondition({Key? key}) : super(key: key);

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
            const Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: CustomText(
                title: "Please read carefully and confirm the points below",
                color: AppColor.white,
                fontType: FontType.Onest,
                fontWeight: FontWeights.bold,
                size: 24,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            recoveryTermConditionTile(
              context: context,
              text:
                  'Anyone with access to the 12 word recovery phrase has access to my wallet.',
              isSelected: true,
            ),
            const SizedBox(
              height: 20,
            ),
            recoveryTermConditionTile(
              context: context,
              text:
                  'I am responsible to keeping my phrase safe secure.',
              isSelected: false,
            ),
            const SizedBox(
              height: 20,
            ),
            recoveryTermConditionTile(
              context: context,
              text:
                  'We cannot support or help you in recovering your 12 word phrase if you lose it.',
              isSelected: false,
            ),
            const SizedBox(
              height: 20,
            ),
            recoveryTermConditionTile(
              context: context,
              text:
                  'Do not store your phrase digitally.',
              isSelected: false,
            ),
            Spacer(),



            PrimaryBTN(
              callback: () {


                // if (formKey.currentState!.validate()) {}
                Get.toNamed(AppRoutes.phraseInputScreen );
              },
              width: AppConfig(context).width,
              textCLR: AppColor.primaryColor,
              color: AppColor.white,
              height: 60,
              title: "I read and understood",
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
