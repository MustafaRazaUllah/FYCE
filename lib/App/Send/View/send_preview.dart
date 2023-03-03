import 'package:biticonapp/App/Buy/View/Components/buy_preview_tile.dart';
import 'package:biticonapp/App/Wallet/View/Components/transation_history_detail_tile.dart';
import 'package:biticonapp/Common/AppBTN/primary_btn.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:biticonapp/RoutesAndBindings/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/AppBar/primary_app_bar.dart';
import '../../../Common/AppText/AppTextView.dart';
import '../../../Common/Constant/AppConfig.dart';

class SendPreview extends StatelessWidget {
  const SendPreview({Key? key}) : super(key: key);

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
              title: 'Send Preview',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/Bitcoin.png")),
                    color: AppColor.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                const CustomText(
                  title: "BTC 0.2104876",
                  color: AppColor.white,
                  fontType: FontType.Onest,
                  fontWeight: FontWeights.bold,
                  size: 22,
                ),
              ],
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
                text: 'To',
                text1: '1DhQop23bvsidojskfapCPH9AeKTb2p',
                context: context),
            buyPreviewTile(
                text: 'Amount', text1: 'CHF 23’189.21', context: context),
            buyPreviewTile(text: 'Fee', text1: '1.5%', context: context),
            const SizedBox(
              height: 10,
            ),
            transactionHistoryDetailTile(
                heading: "Total ",
                heading2: "BTC 1.1201",
                localCurrencyColor: AppColor.white,
                weight: FontWeights.bold),
            const SizedBox(
              height: 10,
            ),
            const Divider(color: AppColor.greyText),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
              title:
                  "Please double check the address and make sure it is the correct receiving address. If the address is incorrect the funds cannot be retrieved.",
              color: AppColor.greyText,
              fontWeight: FontWeights.regular,
              size: 12,
              fontType: FontType.Onest,
            ),
            const Spacer(),
            PrimaryBTN(
              callback: () {
                // if (formKey.currentState!.validate()) {}
                // Get.toNamed(
                //   AppRoutes.sendSucessView,
                // );
                Get.offNamed(
                  AppRoutes.processingScreen,
                  arguments: [
                    "Processing Payment...",
                    "Transfer",
                  ],
                );
              },
              width: AppConfig(context).width,
              textCLR: AppColor.primaryColor,
              color: AppColor.white,
              height: 60,
              title: "Send",
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
