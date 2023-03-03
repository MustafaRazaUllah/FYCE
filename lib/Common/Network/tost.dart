import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Toast {
  success({required massage}) {
    return Get.snackbar(
      "Success",
      massage,
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColor.greyText, //.withOpacity(0.6),
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: AppColor.white,
      duration: const Duration(seconds: 3),
    );
  }

  error({required massage}) {
    if (Get.isSnackbarOpen == false) {
      return Get.snackbar(
        "Error",
        massage,
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.red,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: AppColor.white,
        duration: const Duration(seconds: 3),
      );
    }
  }
}
