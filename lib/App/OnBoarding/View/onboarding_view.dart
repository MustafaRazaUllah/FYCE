import 'package:biticonapp/Common/AppBTN/primary_btn.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:biticonapp/Common/Network/cache_handler.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:biticonapp/RoutesAndBindings/app_routes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Common/AppText/AppTextView.dart';
import '../../../Common/Constant/AppConfig.dart';

import '../View Model/onboarding_view_model.dart';
import 'on_board_screen1.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({
    Key? key,
  }) : super(key: key);

  final onBoardingVM = Get.find<OnBoardingViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background_new.png"),
                fit: BoxFit.fill),
          ),
          padding: EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.bottomCenter,
          child: SafeArea(
            top: true,
            bottom: true,
            left: false,
            right: false,
            child: Column(
              children: [
                Obx(
                  () => Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.screenWidth / 5,
                      ),
                      child: Image.asset(
                        onBoardingVM.selectedPageIndex.value == 0
                            ? "assets/images/boarding1.png"
                            : onBoardingVM.selectedPageIndex.value == 1
                                ? "assets/images/boarding2.png"
                                : "assets/images/boarding3.png",
                        width: SizeConfig.screenWidth / 2.1,
                        // height: SizeConfig.screenWidth / 2.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight / 2.8,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onBoardingVM.onBoardingPages.length,
                          (index) => Obx(() {
                            return Container(
                              margin: const EdgeInsets.all(5),
                              width:
                                  onBoardingVM.selectedPageIndex.value == index
                                      ? SizeConfig.screenWidth * 0.1
                                      : 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: onBoardingVM.selectedPageIndex.value ==
                                        index
                                    ? AppColor.onboard
                                    : AppColor.greyText,
                                borderRadius: BorderRadius.circular(
                                    onBoardingVM.selectedPageIndex.value ==
                                            index
                                        ? 8
                                        : 50),
                              ),
                            );
                          }),
                        ),
                      ),
                      Expanded(
                        child: CarouselSlider(
                          carouselController:
                              onBoardingVM.buttonCarouselController,
                          options: CarouselOptions(
                            initialPage: onBoardingVM.selectedPageIndex.value,
                            enableInfiniteScroll: false,
                            pageSnapping: true,
                            reverse: false,
                            autoPlay: false,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            // enlargeCenterPage: true,
                            // onPageChanged: callbackFunction,
                            onPageChanged: (index, reason) {
                              onBoardingVM.onChangeSelectedPageIndex(index);
                            },
                            disableCenter: true,
                            viewportFraction: 1,
                            enlargeCenterPage: false,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: onBoardingVM.onBoardingPages.map((index) {
                            return Builder(
                              builder: (BuildContext context) {
                                return OnBoardScreen1(
                                  heading: index.title,
                                  subHeading: index.description,
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      PrimaryBTN(
                        callback: () {
                          if (onBoardingVM.selectedPageIndex.value == 2) {
                            Get.toNamed(AppRoutes.optionView);
                            DatabaseHandler().setOnBoarding(true);
                          } else {
                            onBoardingVM.buttonCarouselController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear,
                            );
                          }
                        },
                        width: AppConfig(context).width / 1.2,
                        textCLR: AppColor.primaryColor,
                        color: AppColor.white,
                        height: 60,
                        isOnBoard: true,
                        title: "Next",
                        borderRadius: 12,
                        fontWeight: FontWeights.extraBold,
                      ),
                    ],
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
