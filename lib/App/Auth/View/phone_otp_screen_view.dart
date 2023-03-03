import 'package:biticonapp/App/Auth/ViewModel/sign_up_view_model.dart';
import 'package:biticonapp/Common/AppBTN/primary_btn.dart';
import 'package:biticonapp/Common/AppBar/auth_app_bar.dart';
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../Common/AppText/font_type.dart';
import '../../../Common/Constant/AppConfig.dart';
import '../../../RoutesAndBindings/app_routes.dart';
import 'components/otp_form_fields.dart';

class PhoneOtpScreenView extends StatelessWidget {
  PhoneOtpScreenView({Key? key}) : super(key: key);

  final _serviceVM = Get.find<SignUpViewModel>();
  final String phone = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Container(
        color: AppColor.primaryColor,
        child: SafeArea(
          top: true,
          bottom: true,
          left: false,
          right: false,
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            height: AppConfig(context).height,
            width: AppConfig(context).width,
            child: Column(
              children: [
                AuthAppBar(
                  isBackIcon: true,
                  headingText: 'Phone Verification',
                  subHeadingText: 'We have sent a code to your number\n$phone',
                ),
                const SizedBox(
                  height: 30,
                ),
                OtpFormFields(
                  onComplete: (String val) {
                    print("object $val");
                    _serviceVM.smsOTPSubmit(val);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      title: "Didn’t receive a code?",
                      color: AppColor.greyText,
                      size: SizeConfig.screenWidth * 0.033,
                      fontType: FontType.Onest,
                      fontWeight: FontWeights.regular,
                    ),
                    Obx(
                      () => TextButton(
                        onPressed: () {
                          if (_serviceVM.counter.value == 60) {
                            _serviceVM.reSendTimer("phoneOTP");
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
        ),
      ),
    );
  }
}
