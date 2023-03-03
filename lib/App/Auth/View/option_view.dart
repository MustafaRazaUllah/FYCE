import 'package:biticonapp/App/Auth/ViewModel/sign_up_view_model.dart';
import 'package:biticonapp/Common/AppBTN/primary_btn.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:biticonapp/RoutesAndBindings/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/AppText/AppTextView.dart';

class OptionView extends StatelessWidget {
  OptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: AppColor.primaryColor,
      child: SafeArea(
        top: true,
        bottom: true,
        left: false,
        right: false,
        child: Scaffold(
          backgroundColor: AppColor.primaryColor,
          body: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.center,
              width: AppConfig(context).width,
              height: AppConfig(context).height,
              child: Column(
                children: [
                  // SizedBox(height: AppConfig(context).height / 4),
                  SizedBox(height: SizeConfig.screenHeight * 0.2),
                  Image(
                    image: AssetImage('assets/logo/logo.png'),
                    height: SizeConfig.screenWidth * 0.2,
                    width: SizeConfig.screenWidth * 0.2,
                  ),
                  SizedBox(height: AppConfig(context).height / 10),
                  CustomText(
                    title:
                        "Use and Experience the most user-friendly crypto app to Buy, Manage, and Pay using Crypto",
                    color: AppColor.white,
                    alignment: TextAlign.center,
                    size: SizeConfig.screenWidth * 0.05,
                    height: 1.5,
                    fontType: FontType.Avenir,
                    fontWeight: FontWeights.extraBold,
                  ),
                  Spacer(),
                  PrimaryBTN(
                    callback: () {
                      Get.toNamed(AppRoutes.signInView);
                    },
                    width: AppConfig(context).width / 1.1,
                    textCLR: AppColor.primaryColor,
                    color: AppColor.white,
                    height: 60,
                    borderRadius: 14,
                    title: "Login",
                    fontWeight: FontWeights.extraBold,
                  ),
                  const SizedBox(height: 10),
                  PrimaryBTN(
                    callback: () {
                      Get.toNamed(AppRoutes.signUpView);
                    },
                    width: AppConfig(context).width / 1.1,
                    textCLR: AppColor.white,
                    color: AppColor.primaryColor,
                    height: 60,
                    isBorder: true,
                    borderRadius: 0,
                    title: "Sign Up",
                    fontWeight: FontWeights.extraBold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: () {
                // Get.toNamed(AppRoutes.signUpView);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      title: "Continue as Guest?",
                      color: AppColor.greyText,
                      size: SizeConfig.screenWidth * 0.033,
                      fontType: FontType.Onest,
                      fontWeight: FontWeights.regular),
                  TextButton(
                    onPressed: () {},
                    child: CustomText(
                      title: "Click Here",
                      color: AppColor.white,
                      size: SizeConfig.screenWidth * 0.035,
                      fontType: FontType.Onest,
                      fontWeight: FontWeights.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
