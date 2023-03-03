import 'package:biticonapp/Common/AppBTN/primary_btn.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:biticonapp/RoutesAndBindings/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../../Common/AppBar/primary_app_bar.dart';
import '../../../Common/AppText/AppTextView.dart';
import '../../../Common/Constant/AppConfig.dart';
import 'Components/buy_preview_tile.dart';

class BuyPreview extends StatelessWidget {
  const BuyPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          children: [
            primaryAppBar(
              context: context,
              title: 'Order Preview',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              title: "BTC 0.2104876",
              color: AppColor.white,
              fontType: FontType.Onest,
              fontWeight: FontWeights.bold,
              size: 22,
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
                width: AppConfig(context).width / 2,
                child: const Divider(
                  color: AppColor.greyText,
                )),
            const SizedBox(
              height: 30,
            ),
            buyPreviewTile(
                text: 'Rate',
                text1: 'CHF 16’750.23',
                context: context,
                text1Color: AppColor.onboard),
            buyPreviewTile(
                text: 'Purchase', text1: 'CHF 985.00', context: context),
            buyPreviewTile(text: 'Fee', text1: '1.5%', context: context),
            buyPreviewTile(
                text: 'Method', text1: 'Credit Card *9988', context: context),
            buyPreviewTile(
                text: 'Total', text1: 'CHF 1’000.00', context: context),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      title: "Recurring investment",
                      fontWeight: FontWeights.bold,
                      fontType: FontType.Onest,
                      size: 14,
                      color: AppColor.white,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        CustomText(
                          title: "Weekly",
                          fontWeight: FontWeights.bold,
                          fontType: FontType.Onest,
                          size: 14,
                          color: AppColor.greyText,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Image(
                          image: AssetImage('assets/icons/drop.png'),
                          height: 15,
                          color: AppColor.greyText,
                        )
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                FlutterSwitch(
                  height: 25.0,
                  width: 45.0,
                  padding: 4.0,
                  toggleSize: 20.0,
                  borderRadius: 30.0,
                  inactiveColor: AppColor.greyLightShade,
                  activeColor: AppColor.switchColor,
                  value: false,
                  onToggle: (value) {},
                ),
              ],
            ),
            Spacer(),
            PrimaryBTN(
              callback: () {
                // if (formKey.currentState!.validate()) {}
                Get.offNamed(
                  AppRoutes.processingScreen,
                  arguments: [
                    "Processing Payment...",
                    "Buy",
                  ],
                );
              },
              width: AppConfig(context).width,
              textCLR: AppColor.primaryColor,
              color: AppColor.onboard,
              height: 60,
              title: "Buy now",
              borderRadius: 10,
              fontWeight: FontWeights.extraBold,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
