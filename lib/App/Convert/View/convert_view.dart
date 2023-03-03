import 'package:biticonapp/App/Convert/View/Components/convert_tile.dart';
import 'package:biticonapp/App/Convert/View/crypto_convert_listing_sheet.dart';
import 'package:biticonapp/App/Send/View/crypto_send_listing_sheet.dart';
import 'package:biticonapp/Common/AppBTN/primary_btn.dart';
import 'package:biticonapp/Common/AppBar/primary_app_bar.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:biticonapp/Common/custom_botttom_sheet.dart';
import 'package:flutter/material.dart';

import '../../../Common/AppText/AppTextView.dart';

class ConvertView extends StatelessWidget {
  const ConvertView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 20, top: 50),
        child: Column(
          children: [
            primaryAppBar(
                context: context,
                title: 'Convert',
                isWallet: true,
                fontSize: 24,
                fontType: FontType.Avenir),
            const SizedBox(
              height: 10,
            ),
            convertTile(
                recievePrice: '1.229',
                sellPrice: '0.02943',
                price: '1.23754',
                onTap: () {
                  customBottomSheet(
                      context: context,
                      child: const CryptoCryptoListingSheet());
                }),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
                title: '1 BTC ≈ 14.21412 ETH ',
                color: AppColor.greyText,
                size: 12),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(title: 'Fee', color: AppColor.greyText, size: 12),
                CustomText(title: '1.5%', color: AppColor.greyText, size: 12),
              ],
            ),
            const Spacer(),
            PrimaryBTN(
              callback: () {
                // Get.toNamed(AppRoutes.sendPreview, );
              },
              width: AppConfig(context).width,
              textCLR: AppColor.primaryColor,
              color: AppColor.white,
              height: 60,
              title: 'Convert ',
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
