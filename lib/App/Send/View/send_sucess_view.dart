import 'package:biticonapp/App/Buy/View/Components/buy_preview_tile.dart';
import 'package:biticonapp/Common/AppBar/primary_app_bar.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/AppBTN/primary_btn.dart';
import '../../../Common/AppText/AppTextView.dart';
import '../../../RoutesAndBindings/app_routes.dart';
import '../../Wallet/View/Components/transation_history_detail_tile.dart';

class SendSucessView extends StatelessWidget {
  const SendSucessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          children: [
            const CustomText(
              title: "Successfully Sent Bitcoin",
              color: AppColor.white,
              fontType: FontType.Onest,
              fontWeight: FontWeights.bold,
              size: 22,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/Bitcoin.png")),
                    color: AppColor.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      title: "- 1.12 BTC",
                      color: AppColor.white,
                      fontType: FontType.Onest,
                      fontWeight: FontWeights.bold,
                      size: 22,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      title: "- CHF 23’189.21",
                      color: AppColor.greyText,
                      fontType: FontType.Onest,
                      fontWeight: FontWeights.regular,
                      size: 12,
                    ),
                  ],
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
            transactionHistoryDetailTile(
                heading: "To ",
                heading2: "1DhQop23bvsidojskfapCPH9AeKTb2p",
                localCurrencyColor: AppColor.white,
                weight: FontWeights.bold),
            const SizedBox(
              height: 20,
            ),
            transactionHistoryDetailTile(
              heading: "Price ",
              heading2: "CHF 23’189.21",
            ),
            const SizedBox(
              height: 20,
            ),
            transactionHistoryDetailTile(
              heading: "Date ",
              heading2: " 17:11 - Nov 19, 2023",
            ),
            const SizedBox(
              height: 20,
            ),
            transactionHistoryDetailTile(
              heading: "Network ",
              heading2: " Bitcoin",
            ),
            const SizedBox(
              height: 20,
            ),
            transactionHistoryDetailTile(
              heading: "Network Fee ",
              heading2: "BTC 0.00",
            ),
            const SizedBox(
              height: 20,
            ),
            transactionHistoryDetailTile(
              heading: "Status ",
              heading2: "Completed",
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                title: "View on Blockchain Explorer",
                color: AppColor.white,
                fontType: FontType.Onest,
                fontWeight: FontWeights.regular,
                textDecoration: TextDecoration.underline,
                size: 12,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: AppColor.greyText,
            ),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),
            Image(
              image: const AssetImage("assets/icons/sucessCircle.png"),
              height: AppConfig(context).height / 8,
            ),
            const Spacer(),
            const SizedBox(
              height: 20,
            ),
            PrimaryBTN(
              callback: () {
                // if (formKey.currentState!.validate()) {}
                Get.offAllNamed(AppRoutes.navbarView);
              },
              width: AppConfig(context).width,
              textCLR: AppColor.primaryColor,
              color: AppColor.white,
              height: 60,
              title: "Done",
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
