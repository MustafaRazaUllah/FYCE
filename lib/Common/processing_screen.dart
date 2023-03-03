import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:biticonapp/RoutesAndBindings/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProcessingScreen extends StatefulWidget {
  ProcessingScreen({Key? key}) : super(key: key);

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  final String text = Get.arguments[0];
  final String type = Get.arguments[1];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      navigatorMethod();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SizedBox(
        width: AppConfig(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: AppConfig(context).height / 6,
            ),
            const Image(
              image: AssetImage('assets/logo/logo.png'),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomText(
              title: text,
              fontType: FontType.Onest,
              size: 16,
              fontWeight: FontWeights.regular,
              color: AppColor.white,
            )
          ],
        ),
      ),
    );
  }

  void navigatorMethod() {
    if (type.toLowerCase() == "buy") {
      Get.offNamed(
        AppRoutes.buySuccessView,
        arguments: ["BTC 0.234221"],
      );
    } else if (type.toLowerCase() == "transfer") {
      Get.offNamed(
        AppRoutes.sendSucessView,
      );
    } else if (type.toLowerCase() == "varification pending") {
      Get.offNamed(
        AppRoutes.getVarificationPending,
      );
    }
  }
}
