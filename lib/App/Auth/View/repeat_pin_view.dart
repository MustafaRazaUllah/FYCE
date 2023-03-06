import 'package:biticonapp/App/Auth/ViewModel/sign_up_view_model.dart';
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Common/AppBar/pin_app_bar.dart';
import '../../../Common/AppText/font_type.dart';
import '../../../Common/Constant/AppConfig.dart';
import 'components/otp_form_fields.dart';

class RepeatPinView extends StatelessWidget {
  RepeatPinView({Key? key}) : super(key: key);
  final _serviceVM = Get.find<SignUpViewModel>();
  final bool fromside = Get.arguments[0];
  final int backContextNumber = Get.arguments[1];
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
            PinAppBar(
              isBackIcon: false,
              headingText: 'Protect your Login',
              subHeadingText: '',
              subHeadingText1: "",
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomText(
                title: "Repeat your PIN Code",
                color: AppColor.greyText,
                height: 2.0,
                fontType: FontType.Onest,
                size: 14,
                fontWeight: FontWeights.regular),
            const SizedBox(
              height: 30,
            ),
            OtpFormFields(
              onComplete: (val) {
                _serviceVM.re_protectKey.value.text = val;
                _serviceVM.protectKeySubmit(
                    from: fromside, backcontextNumber: backContextNumber + 1);
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
