import 'dart:async';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import '../Model/onboarding_model.dart';

class OnBoardingViewModel extends GetxController {
  Timer? timer;
  Rx<int> selectedPageIndex = 0.obs;
  onChangeSelectedPageIndex(int num) {
    selectedPageIndex.value = num;
  }

  bool? serviceEnabled;
  CarouselController buttonCarouselController = CarouselController();
  bool isSignUpButtonPressed = false;

  List<OnboardingInfo> onBoardingPages = [
    OnboardingInfo("Buy Cryptocurrencies",
        "Cryptocurrencies bought on Fyce are in your wallet\nwhich you will own the private keys for."),
    OnboardingInfo("Manage Finances",
        "A simple easy to use dashboard to help you manage\nand keep full control of your investments and day to\nday finances."),
    OnboardingInfo("Paying using Fyce Card", "This feature is coming soon!"),
  ];
}
