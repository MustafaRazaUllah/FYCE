import 'package:biticonapp/App/Auth/ViewModel/login_viewmodel.dart';
import 'package:biticonapp/Common/AppBar/auth_app_bar.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:biticonapp/Common/FormFIelds/primary_text_field.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../Common/AppBTN/primary_btn.dart';
import '../../../Common/AppText/AppTextView.dart';
import '../../../RoutesAndBindings/app_routes.dart';

class SignInView extends StatelessWidget {
  bool fromOther;
  SignInView({Key? key, this.fromOther = false}) : super(key: key);

  final _serviceVM = Get.find<LoginViewModel>();
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
                key: _serviceVM.loginFormKey,
                child: Obx(
                  () => ListView(
                    children: [
                      AuthAppBar(
                        isBackIcon: true,
                        headingText: 'Sign In To Your Account',
                        subHeadingText: 'Welcome back!',
                      ),
                      SizedBox(height: SizeConfig.screenWidth * 0.04),
                      PrimaryTextField(
                        isPass: false,
                        isEmail: true,
                        onChange: (value) {
                          _serviceVM.isActiveLoginBtn.value =
                              _serviceVM.email.value.text.isNotEmpty &&
                                  _serviceVM.password.value.text.isNotEmpty;
                        },
                        hintText: "Enter your email address",
                        prefixIcon: "assets/icons/message.png",
                        errorText: "Enter your email address",
                        width: AppConfig(context).width,
                        controller: _serviceVM.email.value,
                        keyBoardType: TextInputType.emailAddress,
                        maxLine: 1,
                        headingText: "Email address",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PrimaryTextField(
                        isPass: true,
                        onChange: (value) {
                          _serviceVM.isActiveLoginBtn.value =
                              _serviceVM.email.value.text.isNotEmpty &&
                                  _serviceVM.password.value.text.isNotEmpty;
                        },
                        hintText: "Enter your password",
                        prefixIcon: "assets/icons/password.png",
                        errorText: "Enter your password",
                        width: AppConfig(context).width,
                        controller: _serviceVM.password.value,
                        keyBoardType: TextInputType.text,
                        isSimpleValidation: false,
                        maxLine: 1,
                        maxLength: 20,
                        headingText: "Password",
                      ),

                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.forgetView);
                        },
                        child: Container(
                          height: 30,
                          margin: EdgeInsets.only(
                            right: SizeConfig.screenWidth / 1.8,
                            top: SizeConfig.screenWidth * 0.02,
                          ),
                          color: AppColor.primaryColor,
                          child: CustomText(
                            title: "Forgot password?",
                            color: AppColor.white,
                            size: SizeConfig.screenWidth * 0.033,
                            fontType: FontType.Onest,
                            fontWeight: FontWeights.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenWidth * 0.04),
                      PrimaryBTN(
                        callback: () {
                          FocusScope.of(context).unfocus();
                          _serviceVM.onLogin(from: fromOther);
                        },
                        isActive: true, // _serviceVM.isActiveLoginBtn.value,
                        loading: _serviceVM.isLoadingLogin.value,
                        width: double.infinity,
                        textCLR: AppColor.primaryColor,
                        color: AppColor.white,
                        height: 60,
                        title: 'Login',
                        borderRadius: 12,
                        fontWeight: FontWeights.extraBold,
                      ),
                      // const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.signUpView);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        title: "Don’t have an account?",
                        color: AppColor.greyText,
                        size: SizeConfig.screenWidth * 0.033,
                        fontType: FontType.Onest,
                        fontWeight: FontWeights.regular),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.signUpView, arguments: fromOther);
                      },
                      child: CustomText(
                          title: "Sign up",
                          color: AppColor.white,
                          size: SizeConfig.screenWidth * 0.035,
                          fontType: FontType.Onest,
                          fontWeight: FontWeights.bold),
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
      ),
    );
  }
}
