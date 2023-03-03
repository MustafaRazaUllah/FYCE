import 'package:biticonapp/App/Auth/Model/login_model.dart';
import 'package:biticonapp/Common/Network/api_client.dart';
import 'package:biticonapp/Common/Network/api_urls.dart';
import 'package:biticonapp/Common/Network/cache_handler.dart';
import 'package:biticonapp/Common/Network/tost.dart';
import 'package:biticonapp/RoutesAndBindings/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  RxBool isVisiblePass = false.obs;
  RxBool isActiveLoginBtn = false.obs;
  RxBool isLoadingLogin = false.obs;
  RxString accessToken = "".obs;

  final loginFormKey = GlobalKey<FormState>();
  void onLogin() async {
    if (loginFormKey.currentState!.validate()) {
      isLoadingLogin.value = true;
      print("Login Successfully");
      Map data = {
        "email": email.value.text,
        "password": password.value.text,
      };
      var response = await API().post(ApiManager.SIGNIN, data);
      print("Login code-> ${response}");
      if (response == null) {
        isLoadingLogin.value = false;
      }
      if (response.data["success"] == true &&
          response.data["statusCode"] == 200) {
        Userlogin userData = await Userlogin.fromJson(response.data["data"]);
        DatabaseHandler().setLoginUser(userData);
        if (userData.isActive) {
          Toast().success(massage: response.data["message"]);
          DatabaseHandler().setToken(userData.token);
          isLoadingLogin.value = false;
          Get.offAllNamed(AppRoutes.navbarView);
        } else if (!userData.isPhoneVerified) {
          //
          /* Verification with SMS OTP */
          //
          accessToken.value = userData.token;
          var resp = await API()
              .GetData(ApiManager.SEND_SMS_OTP, accesstoken: accessToken.value);
          if (resp == null) {
            isLoadingLogin.value = false;
          }
          if (resp.data["success"] == true && resp.data["statusCode"] == 200) {
            Toast().success(massage: response.data["message"]);
            Get.toNamed(
              AppRoutes.phoneOtpScreenView,
              arguments: userData.countryCode + userData.contact,
            );
            isLoadingLogin.value = false;
          } else {
            Toast().error(massage: resp.data["message"]);
            isLoadingLogin.value = false;
          }
        } else if (!userData.isEmailVerified) {
          //
          /* Verification with Email OTP */
          //
          accessToken.value = userData.token;
          var response = await API().GetData(
            ApiManager.SEND_EMAIL_OTP,
            accesstoken: accessToken.value,
          );
          if (response == null) {
            isLoadingLogin.value = false;
          }
          if (response.data["success"] == true &&
              response.data["statusCode"] == 200) {
            isLoadingLogin.value = false;
            Get.toNamed(
              AppRoutes.emailOtpScreenView,
              arguments: email.value.text,
            );
            Toast().success(massage: response.data["message"]);
          }
          isLoadingLogin.value = false;
        } else if (!userData.isKeyProtected) {
          //
          /* Add Protect key */
          //
          // Toast().success(massage: "ProtectKey Verification is pending");
          accessToken.value = userData.token;
          Get.toNamed(AppRoutes.addPinView);
          isLoadingLogin.value = false;
        }
      } else {
        Toast().error(massage: "Something was wrong");
        isLoadingLogin.value = false;
      }
    }
  }
}
