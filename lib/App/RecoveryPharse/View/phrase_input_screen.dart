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
import '../../../Common/FormFIelds/secondary_text_field.dart';
import '../../../RoutesAndBindings/app_routes.dart';

class PhraseInputScreen extends StatelessWidget {
  const PhraseInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: PrimaryBTN(
          callback: () {
            // if (formKey.currentState!.validate()) {}
            // Get.toNamed(AppRoutes.recoveryTermAndCondition );
          },
          width: AppConfig(context).width,
          textCLR: AppColor.primaryColor,
          color: AppColor.white,
          height: 60,
          title: "Continue",
          borderRadius: 10,
          fontWeight: FontWeights.extraBold,
        ),
      ),
      backgroundColor: AppColor.strokeGrey,
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          children: [
            primaryAppBar(
              context: context,
              title: 'Recovery Phrase',
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 20,top: 30),
              child: CustomText(
                title: "Your recovery phrase",
                color: AppColor.white,
                fontType: FontType.Onest,
                fontWeight: FontWeights.bold,
                size: 24,
              ),
            ),
            const CustomText(
              title:
                  "Please write down the following words and store them safely.",
              color: AppColor.white,
              height: 1.5,
              fontType: FontType.Onest,
              fontWeight: FontWeights.regular,
              size: 18,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SecondaryTextField(
                          isPass: false,
                          onChange: (value) {},
                          hintText: "Type here",
                          // prefixIcon: "assets/icons/person.png",
                          errorText: "Please Filled MM/YYYY",
                          width: AppConfig(context).width / 2.3,
                          borderRadius: 10,
                          numberText: "1.",
                          controller: TextEditingController(),

                          headingText: ""),
                      SecondaryTextField(
                          isPass: false,
                          onChange: (value) {},
                          hintText: "Type here",
                          // prefixIcon: "assets/icons/person.png",
                          errorText: "Please Filled MM/YYYY",
                          width: AppConfig(context).width / 2.3,
                          borderRadius: 10,
                          numberText: "2.",
                          controller: TextEditingController(),

                          headingText: ""),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SecondaryTextField(
                          isPass: false,
                          onChange: (value) {},
                          hintText: "Type here",
                          // prefixIcon: "assets/icons/person.png",
                          errorText: "Please Filled MM/YYYY",
                          width: AppConfig(context).width / 2.3,
                          borderRadius: 10,
                          numberText: "3.",
                          controller: TextEditingController(),

                          headingText: ""),
                      SecondaryTextField(
                          isPass: false,
                          onChange: (value) {},
                          hintText: "Type here",
                          // prefixIcon: "assets/icons/person.png",
                          errorText: "Please Filled MM/YYYY",
                          width: AppConfig(context).width / 2.3,
                          borderRadius: 10,
                          numberText: "4.",
                          controller: TextEditingController(),

                          headingText: ""),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SecondaryTextField(
                          isPass: false,
                          onChange: (value) {},
                          hintText: "Type here",
                          // prefixIcon: "assets/icons/person.png",
                          errorText: "Please Filled MM/YYYY",
                          width: AppConfig(context).width / 2.3,
                          borderRadius: 10,
                          numberText: "5.",
                          controller: TextEditingController(),

                          headingText: ""),
                      SecondaryTextField(
                          isPass: false,
                          onChange: (value) {},
                          hintText: "Type here",
                          // prefixIcon: "assets/icons/person.png",
                          errorText: "Please Filled MM/YYYY",
                          width: AppConfig(context).width / 2.3,
                          borderRadius: 10,
                          numberText: "6.",
                          controller: TextEditingController(),

                          headingText: ""),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SecondaryTextField(
                          isPass: false,
                          onChange: (value) {},
                          hintText: "Type here",
                          // prefixIcon: "assets/icons/person.png",
                          errorText: "Please Filled MM/YYYY",
                          width: AppConfig(context).width / 2.3,
                          borderRadius: 10,
                          numberText: "7.",
                          controller: TextEditingController(),

                          headingText: ""),
                      SecondaryTextField(
                          isPass: false,
                          onChange: (value) {},
                          hintText: "Type here",
                          // prefixIcon: "assets/icons/person.png",
                          errorText: "Please Filled MM/YYYY",
                          width: AppConfig(context).width / 2.3,
                          borderRadius: 10,
                          numberText: "8.",
                          controller: TextEditingController(),

                          headingText: ""),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SecondaryTextField(
                          isPass: false,
                          onChange: (value) {},
                          hintText: "Type here",
                          // prefixIcon: "assets/icons/person.png",
                          errorText: "Please Filled MM/YYYY",
                          width: AppConfig(context).width / 2.3,
                          borderRadius: 10,
                          numberText: "9.",
                          controller: TextEditingController(),

                          headingText: ""),
                      SecondaryTextField(
                          isPass: false,
                          onChange: (value) {},
                          hintText: "Type here",
                          // prefixIcon: "assets/icons/person.png",
                          errorText: "Please Filled MM/YYYY",
                          width: AppConfig(context).width / 2.3,
                          borderRadius: 10,
                          numberText: "10.",
                          controller: TextEditingController(),

                          headingText: ""),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SecondaryTextField(
                          isPass: false,
                          onChange: (value) {},
                          hintText: "Type here",
                          // prefixIcon: "assets/icons/person.png",
                          errorText: "Please Filled MM/YYYY",
                          width: AppConfig(context).width / 2.3,
                          borderRadius: 10,
                          numberText: "11.",
                          controller: TextEditingController(),

                          headingText: ""),
                      SecondaryTextField(
                          isPass: false,
                          onChange: (value) {},
                          hintText: "Type here",
                          // prefixIcon: "assets/icons/person.png",
                          errorText: "Please Filled MM/YYYY",
                          width: AppConfig(context).width / 2.3,
                          borderRadius: 10,
                          numberText: "12.",
                          controller: TextEditingController(),

                          headingText: ""),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
