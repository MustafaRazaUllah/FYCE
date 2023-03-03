import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../ViewModel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  final splashVM = Get.find<SplashViewModel>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: AppColor.primaryColor,
          statusBarColor: AppColor.primaryColor,
          systemNavigationBarDividerColor: AppColor.primaryColor),
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Container(
          alignment: Alignment.center,
          width: AppConfig(context).width,
          height: AppConfig(context).height,
          child: const Image(
            image: AssetImage('assets/logo/logo.png'),
          ),
        ),

        // bottomNavigationBar: SizedBox(
        //   height: 200,
        //   child: Column(
        //     children: [
        //       TextButton(
        //         onPressed: () {
        //           splashVM.reSendTimer();
        //         },
        //         child: CustomText(
        //           title: "Click",
        //           color: AppColor.green,
        //         ),
        //       ),
        //       Obx(
        //         () => CustomText(
        //           title: splashVM.counter.value.toString(),
        //           color: AppColor.green,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
