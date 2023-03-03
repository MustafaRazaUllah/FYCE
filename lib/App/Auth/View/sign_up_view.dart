import 'package:biticonapp/App/Auth/ViewModel/sign_up_view_model.dart';
import 'package:biticonapp/Common/AppBar/auth_app_bar.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:biticonapp/Common/FormFIelds/primary_text_field.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:biticonapp/Common/dynamic_webview.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Common/AppBTN/checkbox_button.dart';
import '../../../Common/AppBTN/primary_btn.dart';
import '../../../Common/AppText/AppTextView.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);
  // var signUpViewModel = SignUpViewModel();
  final _serviceVM = Get.find<SignUpViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      child: SafeArea(
        top: true,
        bottom: true,
        left: false,
        right: false,
        child: Scaffold(
          backgroundColor: AppColor.primaryColor,
          body: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            height: AppConfig(context).height,
            width: AppConfig(context).width,
            child: Column(
              children: [
                AuthAppBar(
                  isBackIcon: true,
                  headingText: 'Getting Started',
                  subHeadingText: 'Create an account to continue!',
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Obx(
                      () => Form(
                        key: _serviceVM.signUpFormKey,
                        child: Column(
                          children: [
                            PrimaryTextField(
                              isPass: false,
                              onChange: (value) {
                                // _serviceVM.isActiveSignUpBtn.value = _serviceVM
                                //     .signUpFormKey.currentState!
                                //     .validate();
                              },
                              hintText: "Enter your full name",
                              prefixIcon: "assets/icons/profile.png",
                              errorText: "Please enter your full name",
                              width: AppConfig(context).width,
                              controller: _serviceVM.fullname.value,
                              keyBoardType: TextInputType.text,
                              maxLine: 1,
                              headingText: "Full Name",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            PrimaryTextField(
                              isPass: false,
                              isEmail: true,
                              onChange: (value) {
                                // _serviceVM.isActiveSignUpBtn.value = _serviceVM
                                //     .signUpFormKey.currentState!
                                //     .validate();
                              },
                              hintText: "Enter your email address",
                              prefixIcon: "assets/icons/message.png",
                              errorText: "Please enter your Degree Title",
                              width: AppConfig(context).width,
                              controller: _serviceVM.email.value,
                              keyBoardType: TextInputType.emailAddress,
                              maxLine: 1,
                              headingText: "Email address",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            PrimaryTextField(
                              isPass: true,
                              onChange: (value) {
                                // _serviceVM.isActiveSignUpBtn.value =
                                // _serviceVM.signUpFormKey.currentState!
                                //     .validate();
                              },
                              hintText: "Enter your password",
                              prefixIcon: "assets/icons/password.png",
                              width: AppConfig(context).width,
                              controller: _serviceVM.password.value,
                              maxLine: 1,
                              maxLength: 20,
                              headingText: "Password",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            PrimaryTextField(
                              isPass: true,
                              onChange: (value) {
                                // _serviceVM.isActiveSignUpBtn.value = _serviceVM
                                //     .signUpFormKey.currentState!
                                //     .validate();
                              },
                              hintText: "Repeat your password",
                              prefixIcon: "assets/icons/password.png",
                              width: AppConfig(context).width,
                              controller: _serviceVM.re_password.value,
                              maxLine: 1,
                              maxLength: 20,
                              headingText: "Repeat password",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            PrimaryTextField(
                              isPass: false,
                              onChange: (value) {
                                // _serviceVM.isActiveSignUpBtn.value = _serviceVM
                                //     .signUpFormKey.currentState!
                                //     .validate();
                              },
                              prifixCallback: () {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: true,
                                  onSelect: (Country country) {
                                    _serviceVM.counterSelector(
                                      countrycode: country.phoneCode,
                                      countryname: country.name,
                                    );
                                  },
                                );
                              },
                              hintText: "999 999 999",
                              prefixIcon: _serviceVM.countryCode.value,
                              isTextPrifix: true,
                              errorText: "Please enter phone number",
                              sufixIconColor: AppColor.green,
                              width: AppConfig(context).width,
                              controller: _serviceVM.phone.value,
                              keyBoardType: TextInputType.number,
                              maxLine: 1,
                              maxLength: 20,
                              headingText: "Phone number",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                checkBoxButton(
                                  isSelected: _serviceVM.check.value,
                                  callback: () {
                                    _serviceVM
                                        .onChangeCheck(!_serviceVM.check.value);
                                  },
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text:
                                          "By Creating your account you have to agree with our ",
                                      style: TextStyle(
                                        overflow: TextOverflow.visible,
                                        fontFamily: "Onest",
                                        color: AppColor.white.withOpacity(0.45),
                                        fontWeight: FontWeight.w400,
                                        fontSize: SizeConfig.screenWidth * 0.03,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "Terms and Condition",
                                          style: TextStyle(
                                            overflow: TextOverflow.visible,
                                            fontFamily: "Onest",
                                            color: AppColor.white,
                                            fontWeight: FontWeights.bold,
                                            fontSize:
                                                SizeConfig.screenWidth * 0.032,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              print("Terms and Condition");
                                              Get.to(DynamicWebPage(
                                                title: 'Terms and Condition',
                                                url:
                                                    'https://www.fyce.io/contact',
                                              ));
                                            },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            PrimaryBTN(
                              callback: () {
                                _serviceVM.onSignUp();
                              },
                              width: double.infinity,
                              textCLR: AppColor.primaryColor,
                              color: AppColor.white,
                              height: 60,
                              loading: _serviceVM.isLoadingSignUp.value,
                              isActive: _serviceVM.isActiveSignUpBtn.value,
                              title: 'Sign up',
                              borderRadius: 12,
                              fontWeight: FontWeights.extraBold,
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
              ],
            ),
          ),
          bottomNavigationBar: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                    title: "Already have an account?",
                    color: AppColor.greyText,
                    size: SizeConfig.screenWidth * 0.033,
                    fontType: FontType.Onest,
                    fontWeight: FontWeights.regular),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: CustomText(
                      title: "Sign in",
                      color: AppColor.white,
                      size: SizeConfig.screenWidth * 0.035,
                      fontType: FontType.Onest,
                      fontWeight: FontWeights.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
