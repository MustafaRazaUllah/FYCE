import 'package:biticonapp/App/Send/View/crypto_send_listing_sheet.dart';
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:biticonapp/Common/custom_botttom_sheet.dart';
import 'package:biticonapp/RoutesAndBindings/app_routes.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/AppBTN/pay_button.dart';

Widget portfolioCoinTile({
  required BuildContext context,
  VoidCallback? callback,
  String price = "CHF 16’533.64",
  String percentage = "+12.23%",
  String text = "Bitcoin",
  String text1 = "Btc",
  double padding = 0,
  bool expanded = true,
  String image = "assets/images/Bitcoin.png",
  Color percentageColor = AppColor.onboard,
  Color text1Color = AppColor.white,
}) {
  return GestureDetector(
    onTap: callback,
    child: Container(
      padding: EdgeInsets.only(bottom: expanded ? 10 : 20),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: AppColor.greyText.withOpacity(0.4)))),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: padding,
              right: padding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            image,
                          ),
                        ),
                        color: AppColor.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            title: text,
                            color:
                                expanded ? AppColor.white : AppColor.greyText,
                            size: 17,
                            fontType: FontType.Avenir,
                            fontWeight: FontWeight.w300),
                        CustomText(
                            title: text1,
                            color: text1Color,
                            size: 14,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomText(
                        title: price,
                        color: expanded ? AppColor.white : AppColor.greyText,
                        size: 17,
                        fontType: FontType.Avenir,
                        fontWeight: FontWeight.w300),
                    CustomText(
                        title: percentage,
                        color: percentageColor,
                        size: 14,
                        fontWeight: FontWeight.w500),
                  ],
                ),
              ],
            ),
          ),
          if (expanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 200,
                    ),
                    curve: Curves.linear,
                    // height: 100,
                    width: double.infinity,
                    // color:  AppColor.orange,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        payButton(
                          icon: 'assets/icons/buy.png',
                          title: 'Buy',
                          callback: () {
                            Get.toNamed(AppRoutes.buyCrypto);
                          },
                        ),
                        payButton(
                          icon: 'assets/icons/sell.png',
                          title: 'Sell',
                          callback: () {
                            Get.toNamed(AppRoutes.sellView);
                          },
                        ),
                        payButton(
                          icon: 'assets/icons/send.png',
                          title: 'Send',
                          callback: () {
                            // Get.toNamed(AppRoutes.sellView);
                            customBottomSheet(
                              context: context,
                              child: const CryptoSendListingSheet(),
                            );
                          },
                        ),
                        payButton(
                          icon: 'assets/icons/convert.png',
                          title: 'Convert',
                          callback: () {
                            Get.toNamed(AppRoutes.convertView);
                          },
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   height: 15,
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       begin: Alignment.topCenter,
                  //       end: Alignment.bottomCenter,
                  //       colors: [
                  //         AppColor.green.withOpacity(0.35),
                  //         AppColor.green.withOpacity(0.01),
                  //       ],
                  //     ),
                  //   ),
                  //   width: double.infinity,
                  // ),
                ],
              ),
            ),
        ],
      ),
    ),
  );
}
