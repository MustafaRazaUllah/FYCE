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

class WithDrawPreview extends StatelessWidget {
  const WithDrawPreview({Key? key}) : super(key: key);

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
              title: 'Withdraw Preview',
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/Bitcoin.png")),
                    color: AppColor.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
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
                text1: 'IBAN 1234 5678 9123 4567 8A',
                context: context),
            buyPreviewTile(
                text: 'Amount', text1: 'CHF 23’189.21', context: context),
            buyPreviewTile(text: 'Fee', text1: '1.5%', context: context),
            const SizedBox(
              height: 10,
            ),
            transactionHistoryDetailTile(
                heading: "Total Sold  ",
                heading2: "BTC 1.1201",
                localCurrencyColor: AppColor.white,
                weight: FontWeights.bold),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: AppColor.greyText,
            ),
            const SizedBox(
              height: 10,
            ),
            const   Align(
            alignment: Alignment.topLeft,
            child:    CustomText(
                title:
                    "Note: Withdrawals usually take up to 3 business days.",
                color: AppColor.greyText,
                fontWeight: FontWeights.regular,
                size: 12,
                fontType: FontType.Onest,
              ),
          ),
            Spacer(),
            PrimaryBTN(
              callback: () {
                // if (formKey.currentState!.validate()) {}
                Get.toNamed(AppRoutes.pendingWithDrawView,);
              },
              width: AppConfig(context).width,
              textCLR: AppColor.primaryColor,
              color: AppColor.white,
              height: 60,
              title: "Withdraw",
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
