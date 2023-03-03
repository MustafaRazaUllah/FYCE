import 'package:biticonapp/App/Drawer/View/Components/account_verified_type_tile.dart';
import 'package:biticonapp/Common/AppBTN/primary_btn.dart';
import 'package:biticonapp/Common/AppBar/primary_app_bar.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:biticonapp/RoutesAndBindings/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Common/AppText/AppTextView.dart';
import '../../../Common/AppText/font_type.dart';
import '../../../Common/Constant/AppConfig.dart';
import 'Components/account_basic_type_tile.dart';

class AccountTypeView extends StatelessWidget {
  const AccountTypeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
            systemNavigationBarColor: AppColor.strokeGrey,
            statusBarColor: AppColor.strokeGrey,
            systemNavigationBarDividerColor: AppColor.strokeGrey),
        child: Scaffold(
          backgroundColor: AppColor.strokeGrey,
          body: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            child: Column(
              children: [
                primaryAppBar(
                  context: context,
                  title: 'Account Type',
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 10, bottom: AppConfig(context).height / 14),
                  child: Row(
                    children: const [
                      CustomText(
                        title: "Account Type",
                        color: AppColor.white,
                        fontType: FontType.Avenir,
                        fontWeight: FontWeights.bold,
                        size: 14,
                      ),
                      Spacer(),
                      CustomText(
                        title: "Basic",
                        color: AppColor.greyLightShade,
                        fontType: FontType.Onest,
                        fontWeight: FontWeights.regular,
                        size: 14,
                      ),
                    ],
                  ),
                ),
                accountBasicTypeTile(
                  context: context,
                ),
                const SizedBox(
                  height: 15,
                ),
                accountVerifiedTypeTile(context: context, isSelected: false),
                const Spacer(),
                PrimaryBTN(
                  callback: () {
                    Get.toNamed(
                      AppRoutes.getVerifiedView,
                    );
                  },
                  width: AppConfig(context).width,
                  textCLR: AppColor.primaryColor,
                  color: AppColor.white,
                  height: 60,
                  title: 'Get Verified',
                  borderRadius: 16,
                  fontWeight: FontWeights.extraBold,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
