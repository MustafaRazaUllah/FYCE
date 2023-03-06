import 'package:biticonapp/App/Auth/ViewModel/sign_up_view_model.dart';
import 'package:biticonapp/Common/AppBTN/primary_btn.dart';
import 'package:biticonapp/Common/AppBar/auth_app_bar.dart';
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import '../../../Common/AppBar/pin_app_bar.dart';
import '../../../Common/AppText/font_type.dart';
import '../../../Common/Constant/AppConfig.dart';
import '../../../RoutesAndBindings/app_routes.dart';
import 'components/otp_form_fields.dart';

class FaceIdView extends StatelessWidget {
  FaceIdView({Key? key}) : super(key: key);

  final _serviceVM = Get.find<SignUpViewModel>();
  bool fromside = Get.arguments[0];
  final int backContextNumber = Get.arguments[1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Obx(
        () => Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          height: AppConfig(context).height,
          width: AppConfig(context).width,
          child: Column(
            children: [
              AuthAppBar(
                isBackIcon: false,
                headingText: 'Face ID',
                subHeadingText: '',
              ),
              Row(
                children: [
                  const CustomText(
                      title: "Would you like to use Face ID",
                      color: AppColor.white,
                      size: 14,
                      fontType: FontType.Onest,
                      fontWeight: FontWeights.bold),
                  const Spacer(),
                  FlutterSwitch(
                    height: 25.0,
                    width: 45.0,
                    padding: 4.0,
                    toggleSize: 20.0,
                    borderRadius: 30.0,
                    inactiveColor: AppColor.greyLightShade,
                    activeColor: AppColor.switchColor,
                    value: _serviceVM.isFaceID.value,
                    onToggle: (value) {
                      _serviceVM.FaceIDMethod(value);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 30,
        ),
        child: PrimaryBTN(
          callback: () {
            FocusScope.of(context).unfocus();
            if (fromside) {
              Get.close(backContextNumber);
            } else {
              Get.offAllNamed(
                AppRoutes.navbarView,
              );
            }
          },
          width: double.infinity,
          textCLR: AppColor.primaryColor,
          color: AppColor.white,
          height: 60,
          title: 'Done!',
          borderRadius: 12,
          fontWeight: FontWeights.extraBold,
        ),
      ),
    );
  }
}
