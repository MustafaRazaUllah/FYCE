// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:biticonapp/Common/Network/cache_handler.dart';
import 'package:get/get.dart';

import '../../../RoutesAndBindings/app_routes.dart';

class SplashViewModel extends GetxController {
  Timer? timer;

  @override
  void onInit() {
    // TODO: implement onInit
    timer = Timer(const Duration(seconds: 2), () {
      // checkUser();
      Get.offAllNamed(AppRoutes.onboard);
    });
  }

  checkUser() async {
    bool value = false;
    String accesstoken = "";
    value = await DatabaseHandler().getOnBoarding();
    accesstoken = await DatabaseHandler().getToken();

    if (value) {
      if (accesstoken != "") {
        Get.offAllNamed(AppRoutes.navbarView);
      } else {
        Get.offAllNamed(AppRoutes.optionView);
      }
    } else {
      Get.offAllNamed(AppRoutes.onboard);
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  // Timer? resendTimer;
  // RxInt counter = 10.obs;
  // void reSendTimer() {
  //   print("object");
  //   // var counter = 3;
  //   Timer.periodic(const Duration(seconds: 2), (timer) {
  //     print(timer.tick);
  //     counter.value--;
  //     if (counter.value == 0) {
  //       print('Cancel timer');
  //       timer.cancel();
  //       counter.value = 30;
  //     }
  //   });
  //   // timer = Timer.periodic(const Duration(seconds: 30), (timer) {
  //   //   print("object");
  //   //   if (counter == 0) {
  //   //     print('Cancel timer');
  //   //     timer.cancel();
  //   //   } else {
  //   //     counter--;
  //   //   }
  //   // });
  // }
}
