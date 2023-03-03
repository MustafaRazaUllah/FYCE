import 'package:biticonapp/Common/AppBTN/primary_btn.dart';
import 'package:biticonapp/Common/AppBar/auth_app_bar.dart';
import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:biticonapp/Common/FormFIelds/primary_text_field.dart';

import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Common/Constant/AppConfig.dart';
import '../ViewModel/forget_view_model.dart';
import 'components/forget_send_tile.dart';

class ForgetScreenView extends StatelessWidget {
  ForgetScreenView({Key? key}) : super(key: key);
  final _serviceVM = Get.find<ForgetViewModel>();
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
                  headingText: 'Forgot Password?',
                  subHeadingText:
                      'Please select option to send link\nreset password',
                ),
                Obx(
                  () => Expanded(
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        forgetSendTile(
                          context: context,
                          text: 'Email ',
                          isSelected: _serviceVM.index.value == 1,
                          callback: () {
                            _serviceVM.onChange(1);
                          },
                        ),
                        const SizedBox(height: 10),
                        forgetSendTile(
                          context: context,
                          isSelected: _serviceVM.index.value == 2,
                          text: 'Phone number  📲',
                          callback: () {
                            _serviceVM.onChange(2);
                          },
                        ),
                        const SizedBox(height: 15),
                        _serviceVM.index.value == 1
                            ? Form(
                                key: _serviceVM.forgotFormKey,
                                child: PrimaryTextField(
                                  isPass: false,
                                  onChange: (value) {
                                    _serviceVM.forgotFormKey.currentState!
                                        .validate();
                                    print("object");
                                    _serviceVM.isActiveForgotBtn.value =
                                        value.isNotEmpty ? true : false;
                                  },
                                  hintText: "Enter email",
                                  prefixIcon: "assets/icons/message.png",
                                  errorText: "Please enter valid email",
                                  width: AppConfig(context).width,
                                  controller: _serviceVM.forgotPassword.value,
                                  keyBoardType: TextInputType.text,
                                  maxLine: 1,
                                  headingText: "",
                                ),
                              )
                            : PrimaryTextField(
                                isPass: false,
                                onChange: (value) {
                                  _serviceVM.isActiveForgotBtn.value =
                                      value.isNotEmpty ? true : false;
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
                                prefixIcon: _serviceVM.forgotCountryCode.value,
                                isTextPrifix: true,
                                errorText: "Please enter phone number",
                                sufixIconColor: AppColor.green,
                                width: AppConfig(context).width,
                                controller: _serviceVM.forgotPhone.value,
                                keyBoardType: TextInputType.number,
                                maxLine: 1,
                                maxLength: 20,
                                headingText: "",
                              ),

                        const SizedBox(height: 8),
                        PrimaryBTN(
                          callback: () {
                            _serviceVM.onForgot();
                          },
                          width: AppConfig(context).width,
                          textCLR: AppColor.primaryColor,
                          color: AppColor.white,
                          height: 60,
                          title: 'Forgot Password',
                          borderRadius: 12,
                          isActive: _serviceVM.isActiveForgotBtn.value,
                          loading: _serviceVM.isLoadingForgot.value,
                          fontWeight: FontWeights.extraBold,
                        ),
                        const SizedBox(height: 15),
                        if (_serviceVM.index.value == 1)
                          PrimaryBTN(
                            callback: () {
                              //
                            },
                            width: AppConfig(context).width,
                            textCLR: AppColor.white,
                            color: AppColor.primaryColor,
                            height: 60,
                            isBorder: true,
                            title: 'Resend code',
                            borderRadius: 12,
                            fontWeight: FontWeights.extraBold,
                          ),
                        // SizedBox(
                        //   height: 100,
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
