import 'dart:async';

import 'package:biticonapp/App/Auth/Model/login_model.dart';
import 'package:biticonapp/App/Auth/ViewModel/login_viewmodel.dart';
import 'package:biticonapp/Common/Network/api_client.dart';
import 'package:biticonapp/Common/Network/api_urls.dart';
import 'package:biticonapp/Common/Network/cache_handler.dart';
import 'package:biticonapp/Common/Network/tost.dart';
import 'package:biticonapp/RoutesAndBindings/app_routes.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpViewModel extends GetxController {
  final _loginVM = Get.find<LoginViewModel>();
  Rx<bool> check = false.obs;

  RxString accessToken = "".obs;

  onChangeCheck(bool value) {
    if (signUpFormKey.currentState!.validate()) {
      check.value = value;
      isActiveSignUpBtn.value = value;
    } else {
      isActiveSignUpBtn.value = false;
    }
  }

  Rx<TextEditingController> fullname = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  Rx<TextEditingController> re_password = TextEditingController().obs;
  RxString countryCode = "+41".obs;
  RxString countryName = "Switzerland".obs;
  Rx<TextEditingController> phone = TextEditingController().obs;

  RxBool isVisiblePass = false.obs;
  RxBool isVisibleRePass = false.obs;
  RxBool isActiveSignUpBtn = false.obs;
  RxBool isLoadingSignUp = false.obs;

  final signUpFormKey = GlobalKey<FormState>();

  onSignUp({required bool from}) async {
    if (signUpFormKey.currentState!.validate()) {
      print("SignUp Successfully");
      if (password.value.text != re_password.value.text) {
        Toast().error(massage: "Password and Re-Password not match");
        return;
      }
      isLoadingSignUp.value = true;
      Map data = {
        "fullName": fullname.value.text,
        "email": email.value.text,
        "password": password.value.text,
        "contact": phone.value.text,
        "countryName": countryName.value,
        "countryCode": countryCode.value,
      };
      print("data-> ${data.toString()}");
      var response = await API().post(ApiManager.SIGNUP, data);
      print("Login code-> ${response}");
      if (response == null) {
        isLoadingSignUp.value = false;
      }
      if (response.data["success"] == true &&
          response.data["statusCode"] == 200) {
        accessToken.value = response.data["data"]["token"];
        var resp = await API().GetData(
          ApiManager.SEND_SMS_OTP,
          accesstoken: accessToken.value.isNotEmpty
              ? accessToken.value
              : _loginVM.accessToken.value,
        );
        if (resp == null) {
          isLoadingSignUp.value = false;
        }
        if (resp.data["success"] == true && resp.data["statusCode"] == 200) {
          print("Sent OTP===>>> on Mobile => ${resp.toString()}");
          Toast().success(massage: response.data["message"]);
          Get.toNamed(
            AppRoutes.phoneOtpScreenView,
            arguments: [
              countryCode.value + phone.value.text,
              from,
              3,
            ],
          );
          isLoadingSignUp.value = false;
        } else {
          Toast().error(massage: resp.data["message"]);
          isLoadingSignUp.value = false;
        }
      } else {
        Toast().error(massage: "Something was wrong");
        isLoadingSignUp.value = false;
      }
    }
  }

//
//
//
/* Mobile Phone Varification Submit */
//
//
//

  void smsOTPSubmit(String smsOTP,
      {required bool from, required int backcontextNumber}) async {
    Userlogin userdata = await DatabaseHandler().getLoginUser();
    print("smsOTPSubmit ${accessToken.value}");
    Map data = {"code": smsOTP};
    print("data $data");
    var response = await API().post(
      ApiManager.PHONE_VARIFICATION,
      data,
      accesstoken: accessToken.value.isNotEmpty
          ? accessToken.value
          : _loginVM.accessToken.value,
    );
    if (response.data["success"] == true &&
        response.data["statusCode"] == 200) {
      Toast().success(massage: response.data["message"]);
      await onSendEmailOTP();
      resendTimer?.cancel();
      counter.value = 60;
      Get.toNamed(
        AppRoutes.emailOtpScreenView,
        arguments: [
          email.value.text.isNotEmpty ? email.value.text : userdata.email,
          from,
          backcontextNumber,
        ],
      );
    }
  }

  Future onSendEmailOTP() async {
    print("onSendEmailOTP");
    var response = await API().GetData(
      ApiManager.SEND_EMAIL_OTP,
      accesstoken: accessToken.value.isNotEmpty
          ? accessToken.value
          : _loginVM.accessToken.value,
    );
    if (response.data["success"] == true &&
        response.data["statusCode"] == 200) {
      print("Sent OTP===>>> on Mobile => ${response.toString()}");
      Toast().success(massage: response.data["message"]);
    }
  }

//
//
//
/* Email OTP Varification Submit */
//
//
//
  void emailOTPSubmit(
    String smsOTP, {
    // required bool from,
    // required int backcontextNumber,
    required Function callback,
  }) async {
    print("emailOTPSubmit");
    Map data = {"code": smsOTP};
    var response = await API().post(
      ApiManager.EMAIL_VARIFICATION,
      data,
      accesstoken: accessToken.value.isNotEmpty
          ? accessToken.value
          : _loginVM.accessToken.value,
    );
    if (response.data["success"] == true &&
        response.data["statusCode"] == 200) {
      Toast().success(massage: response.data["message"]);
      resendTimer?.cancel();
      counter.value = 60;
      callback();
    }
  }

  //
//
//
/* Protectkey  Submit */
//
//
//
  Rx<TextEditingController> protectKey = TextEditingController().obs;
  Rx<TextEditingController> re_protectKey = TextEditingController().obs;

  void addProtectkey(String key,
      {required bool from, required int backcontextNumber}) async {
    protectKey.value.text = key;
    Get.toNamed(AppRoutes.repeatPinView, arguments: [
      from,
      backcontextNumber,
    ]);
  }

  void protectKeySubmit(
      {required bool from, required int backcontextNumber}) async {
    print(protectKey.value.text + " == " + re_protectKey.value.text);
    if (protectKey.value.text != re_protectKey.value.text) {
      Toast().error(massage: "PIN Code and Re-PIN Code not match");
      return;
    }
    Map data = {"code": protectKey.value.text};
    print("==>> ${accessToken.value}");
    print("==>> ${_loginVM.accessToken.value}");
    var response = await API().post(
      ApiManager.PROTECT_KEY,
      data,
      accesstoken: accessToken.value.isNotEmpty
          ? accessToken.value
          : _loginVM.accessToken.value,
    );
    if (response.data["success"] == true &&
        response.data["statusCode"] == 200) {
      Toast().success(massage: response.data["message"]);
      DatabaseHandler().setToken(
        accessToken.value.isNotEmpty
            ? accessToken.value
            : _loginVM.accessToken.value,
      );
      Get.toNamed(
        AppRoutes.faceIdView,
        arguments: [
          from,
          backcontextNumber,
        ],
      );
    }
  }

  //
  //
  ///* Re-Protectkey  Submit */
  //
  //

  Timer? resendTimer;
  RxInt counter = 60.obs;
  void reSendTimer(String otpSide) async {
    if (otpSide == "phoneOTP") {
      var resp = await API().GetData(
        ApiManager.SEND_SMS_OTP,
        accesstoken: accessToken.value.isNotEmpty
            ? accessToken.value
            : _loginVM.accessToken.value,
      );
      if (resp.data["success"] == true && resp.data["statusCode"] == 200) {
        Toast().success(massage: resp.data["message"]);
      }
    } else if (otpSide == "emailOTP") {
      onSendEmailOTP();
    }
    print("object");
    // var counter = 3;
    counter.value--;
    resendTimer = Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        print(timer.tick);
        counter.value--;
        if (counter.value == 0) {
          print('Cancel timer');
          timer.cancel();
          counter.value = 60;
        }
      },
    );
  }

  void counterSelector({
    required String countryname,
    required String countrycode,
  }) {
    print("object $countryname $countrycode");
    countryName.value = countryname;
    countryCode.value = "+$countrycode";
  }

  //
  //
  ///* FaceID  Validation */
  //
  //
  RxBool isFaceID = false.obs;
  void FaceIDMethod(bool value) {
    isFaceID.value = value;
  }
}
