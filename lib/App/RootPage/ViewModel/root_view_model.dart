import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:socket_io_client/socket_io_client.dart';

class RootViewModel extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxInt currentItem = 0.obs;
  changeIndex(int index) {
    currentItem.value = index;
  }

  Rx<bool> isWallet = false.obs;
  changeWallet(bool value) {
    isWallet.value = value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
