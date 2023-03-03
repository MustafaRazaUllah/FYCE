import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:biticonapp/Common/custom_botttom_sheet.dart';
import 'package:flutter/material.dart';

import '../../../Common/AppBar/primary_app_bar.dart';
import 'Components/add_card_tile.dart';
import 'Components/payment_method_tile.dart';
import 'add_card_view.dart';

class BuyCryptoView extends StatelessWidget {
  const BuyCryptoView({Key? key}) : super(key: key);

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
              title: 'Buy Bitcoin',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    CustomText(
                      title: "CHF 0.00",
                      color: AppColor.white,
                      fontType: FontType.Onest,
                      fontWeight: FontWeights.bold,
                      size: 22,
                    ),
                    CustomText(
                      title: "BTC = 0.0000",
                      color: AppColor.white,
                      fontType: FontType.Onest,
                      height: 1.5,
                      fontWeight: FontWeights.regular,
                      size: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 2,
                ),
                const ImageIcon(
                  AssetImage('assets/icons/left.png'),
                  color: AppColor.white,
                  size: 16,
                ),
                const ImageIcon(
                  AssetImage('assets/icons/right.png'),
                  color: AppColor.white,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: AppConfig(context).width / 2,
                child: const Divider(
                  color: AppColor.greyText,
                )),
            SizedBox(height: 20,),
            paymentMethodTile(context: context, title: 'Apple Pay', image: "assets/icons/apple.png"),
            SizedBox(height: 20,),
            paymentMethodTile(context: context, title: 'Google Pay', image: "assets/icons/google.png"),
            SizedBox(height: 20,),
            paymentMethodTile(context: context, title: 'Credit Card **4567', image: "assets/icons/card.png"),
            SizedBox(height: 10,),
            addCardTile(callback: (){
              customBottomSheet(
                  context: context,
                  child: AddCardView());
            })


          ],
        ),
      ),
    );
  }
}
