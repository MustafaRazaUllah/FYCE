import 'dart:async';

import 'package:biticonapp/Common/Network/api_client.dart';
import 'package:biticonapp/Common/Network/api_urls.dart';
import 'package:biticonapp/Common/Network/tost.dart';
import 'package:biticonapp/RoutesAndBindings/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgetViewModel extends GetxController {
  Rx<int> index = 1.obs;
  onChange(v) {
    index.value = v;
  }

  final forgotFormKey = GlobalKey<FormState>();
  Rx<TextEditingController> forgotPassword = TextEditingController().obs;
  RxBool isActiveForgotBtn = false.obs;
  RxBool isLoadingForgot = false.obs;
  void onForgot() async {
    if (index.value == 1) {
      if (forgotFormKey.currentState!.validate()) {
        print(forgotFormKey.currentState!.validate());
        isLoadingForgot.value = true;
        Map data = {"email": forgotPassword.value.text};
        var response = await API().post(ApiManager.FORGOT, data);
        if (response == null) {
          isLoadingForgot.value = false;
        } else if (response.data["success"] == true &&
            response.data["statusCode"] == 200) {
          isLoadingForgot.value = false;
          print(response.data["message"]);
          Toast().success(massage: response.data["message"]);
        }
      }
    } else {
      Get.toNamed(
        AppRoutes.forgotphoneverification,
        arguments: forgotCountryCode.value + forgotPhone.value.text,
      );
    }
  }

  void smsOTPSubmit(String val) {
    print(val);
    Get.toNamed(AppRoutes.forgotnewpassword);
  }

  Timer? resendTimer;
  RxInt counter = 60.obs;
  void reSendTimer() async {
    // var resp = await API().GetData(ApiManager.SEND_SMS_OTP);
    // if (resp.data["success"] == true && resp.data["statusCode"] == 200) {
    //   Toast().success(massage: resp.data["message"]);
    // }

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

  Rx<TextEditingController> forgotPhone = TextEditingController().obs;
  RxString forgotCountryCode = "+41".obs;
  RxString forgotCountryName = "Switzerland".obs;
  void counterSelector({
    required String countrycode,
    required String countryname,
  }) {
    forgotCountryCode.value = countrycode;
    forgotCountryName.value = countryname;
  }

  ///
  ///
  ///
  /* Create New Password Section */
  ///
  ///
  ///
  final forgotNewPasswordFormKey = GlobalKey<FormState>();
  void forgotChangePassword() {
    Get.offAllNamed(AppRoutes.optionView);
  }
}
