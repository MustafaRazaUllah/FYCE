import 'package:biticonapp/Common/Theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/AppText/AppTextView.dart';
import '../../../Common/AppText/font_type.dart';
import '../ViewModel/portfolio_view_model.dart';
import 'Components/portfolio_balance_tile.dart';
import 'Components/portfolio_coin_tile.dart';

class PortfolioView extends StatelessWidget {
  PortfolioView({Key? key}) : super(key: key);
  var portfolioViewModel = PortfolioViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              title: "Your Portfolio",
              color: AppColor.white,
              size: 24,
              fontWeight: FontWeights.bold,
              fontType: FontType.Onest,
            ),
            const SizedBox(height: 20),
            portfolioBalanceTile(
                color1: AppColor.greyLightShade,
                color2: AppColor.orange,
                percentage: 30),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Obx(
                      () => portfolioCoinTile(
                        callback: () {
                          portfolioViewModel.onchangeIndex(index + 1);
                        },
                        context: context,
                        expanded: portfolioViewModel.index.value == index + 1,
                        text: "Bitcoin Portfolio",
                        text1: "+12.43%",
                        price: "CHF 1’533.64",
                        percentage: "0.02943",
                        padding: 20,
                        percentageColor: AppColor.greyText,
                        text1Color: AppColor.greyText,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
