import 'package:biticonapp/App/Auth/ViewModel/forget_view_model.dart';
import 'package:biticonapp/App/Auth/ViewModel/login_viewmodel.dart';
import 'package:biticonapp/Common/AppBTN/primary_btn.dart';
import 'package:biticonapp/Common/AppBar/auth_app_bar.dart';
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:biticonapp/Common/FormFIelds/primary_text_field.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:biticonapp/RoutesAndBindings/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ForgotNewPassword extends StatelessWidget {
  ForgotNewPassword({Key? key}) : super(key: key);

  final _serviceVM = Get.find<ForgetViewModel>();
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: AppColor.primaryColor,
          statusBarColor: AppColor.primaryColor,
          systemNavigationBarDividerColor: AppColor.strokeGrey),
      child: Container(
        color: AppColor.primaryColor,
        child: SafeArea(
          top: true,
          bottom: true,
          left: false,
          right: false,
          child: Scaffold(
            backgroundColor: AppColor.primaryColor,
            body: Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              height: AppConfig(context).height,
              width: AppConfig(context).width,
              child: Form(
                // key: _serviceVM.loginFormKey,
                child: ListView(
                  children: [
                    AuthAppBar(
                      isBackIcon: true,
                      headingText: 'Sign In To Your Account',
                      subHeadingText: 'Welcome back!',
                    ),
                    SizedBox(height: SizeConfig.screenWidth * 0.04),
                    PrimaryTextField(
                      isPass: true,
                      onChange: (value) {
                        // _serviceVM.isActiveLoginBtn.value =
                        //     _serviceVM.email.value.text.isNotEmpty &&
                        //         _serviceVM.password.value.text.isNotEmpty;
                      },
                      hintText: "Enter your password",
                      prefixIcon: "assets/icons/password.png",
                      errorText: "Please enter your password",
                      width: AppConfig(context).width,
                      controller:
                          TextEditingController(), //_serviceVM.password.value,
                      keyBoardType: TextInputType.text,
                      isSimpleValidation: false,
                      maxLine: 1,
                      maxLength: 20,
                      headingText: "Password",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PrimaryTextField(
                      isPass: true,
                      onChange: (value) {
                        // _serviceVM.isActiveLoginBtn.value =
                        //     _serviceVM.email.value.text.isNotEmpty &&
                        //         _serviceVM.password.value.text.isNotEmpty;
                      },
                      hintText: "Enter your re-password",
                      prefixIcon: "assets/icons/password.png",
                      errorText: "Please enter your re-password",
                      width: AppConfig(context).width,
                      controller:
                          TextEditingController(), // _serviceVM.password.value,
                      keyBoardType: TextInputType.text,
                      isSimpleValidation: false,
                      maxLine: 1,
                      maxLength: 20,
                      headingText: "Re-password",
                    ),

                    SizedBox(height: SizeConfig.screenWidth * 0.1),
                    PrimaryBTN(
                      callback: () {
                        FocusScope.of(context).unfocus();
                        _serviceVM.forgotChangePassword();
                      },
                      isActive: true, // _serviceVM.isActiveLoginBtn.value,
                      loading: false, //_serviceVM.isLoadingLogin.value,
                      width: double.infinity,
                      textCLR: AppColor.primaryColor,
                      color: AppColor.white,
                      height: 60,
                      title: 'New Password',
                      borderRadius: 12,
                      fontWeight: FontWeights.extraBold,
                    ),
                    // const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
