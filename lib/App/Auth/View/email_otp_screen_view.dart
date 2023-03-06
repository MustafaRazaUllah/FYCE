import 'package:biticonapp/App/Auth/View/components/otp_form_fields.dart';
import 'package:biticonapp/App/Auth/ViewModel/sign_up_view_model.dart';
import 'package:biticonapp/Common/AppBTN/primary_btn.dart';
import 'package:biticonapp/Common/AppBar/auth_app_bar.dart';
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../Common/AppText/font_type.dart';
import '../../../RoutesAndBindings/app_routes.dart';

class EmailOtpScreenView extends StatelessWidget {
  EmailOtpScreenView({Key? key}) : super(key: key);

  final _serviceVM = Get.find<SignUpViewModel>();
  final String email = Get.arguments[0];
  final bool fromSide = Get.arguments[1];
  final int backContextNumber = Get.arguments[2];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        height: AppConfig(context).height,
        width: AppConfig(context).width,
        child: Column(
          children: [
            AuthAppBar(
              isBackIcon: true,
              headingText: 'Email Verification',
              subHeadingText:
                  'We have sent a code to your email address\n$email',
            ),
            const SizedBox(
              height: 30,
            ),
            OtpFormFields(
              onComplete: (val) {
                _serviceVM.emailOTPSubmit(
                  val,
                  from: fromSide,
                  backcontextNumber: backContextNumber + 1,
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                    title: "Didn’t receive a code?  ",
                    color: AppColor.greyText,
                    size: 14,
                    fontType: FontType.Onest,
                    fontWeight: FontWeights.regular),
                Obx(
                  () => TextButton(
                    onPressed: () {
                      if (_serviceVM.counter.value == 60) {
                        _serviceVM.reSendTimer("emailOTP");
                      }
                    },
                    child: CustomText(
                      title: _serviceVM.counter.value == 60
                          ? "Re-send"
                          : "${_serviceVM.counter.value}",
                      color: AppColor.white,
                      size: SizeConfig.screenWidth * 0.035,
                      fontType: FontType.Onest,
                      fontWeight: FontWeights.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
