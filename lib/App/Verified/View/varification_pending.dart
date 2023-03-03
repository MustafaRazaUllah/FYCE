import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:biticonapp/RoutesAndBindings/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class VarificationPending extends StatelessWidget {
  VarificationPending({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: GestureDetector(
        onTap: () {
          Get.offAllNamed(AppRoutes.navbarView);
        },
        child: SizedBox.expand(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Gradient.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox.expand(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: AppConfig(context).height * 0.22,
                    bottom: AppConfig(context).height * 0.1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        title: "Account Verification\nPending",
                        alignment: TextAlign.center,
                        fontType: FontType.Onest,
                        size: AppConfig(context).width * 0.046,
                        height: 1.5,
                        fontWeight: FontWeights.bold,
                        color: AppColor.white.withOpacity(0.9),
                      ),
                      const SizedBox(height: 50),
                      Image.asset(
                        "assets/icons/Vector.png",
                        color: AppColor.userBTN,
                        width: AppConfig(context).width * 0.3,
                        height: AppConfig(context).width * 0.3,
                      ),
                      const Spacer(),
                      CustomText(
                        title: "Tap anywhere to continue",
                        alignment: TextAlign.center,
                        fontType: FontType.Onest,
                        size: AppConfig(context).width * 0.035,
                        height: 1.5,
                        fontWeight: FontWeight.w300,
                        color: AppColor.greyText,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
