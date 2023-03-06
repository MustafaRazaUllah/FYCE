import 'package:biticonapp/App/Home/View/Components/graphTile.dart';
import 'package:biticonapp/App/Home/View/Components/home_coin_tile.dart';

import 'package:biticonapp/App/Wallet/View/Components/wallet_tile.dart';
import 'package:biticonapp/Common/AppBTN/pay_button.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/AppBar/crypto_page_app_bar.dart';
import '../../../Common/AppText/AppTextView.dart';

import '../../../RoutesAndBindings/app_routes.dart';
import '../../Portfolio/View/Components/portfolio_coin_tile.dart';
import 'Components/home_info_tile.dart';

class CoinDetailView extends StatelessWidget {
  const CoinDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Container(
        padding: const EdgeInsets.only(left: 0, right: 0, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cryptoPageAppBar(),
            const SizedBox(
              height: 20,
            ),
            graphTile(
              context,
              data: [
                0.0,
                1.0,
                -3.0,
                1.0,
                -2.0,
                3.0,
                -2.0,
                0.2,
                -3.0,
                1.0,
                -2.0,
                3.0,
                -2.0,
                0.2
              ]
                  .asMap()
                  .entries
                  .map((it) => FlSpot(it.key.toDouble(), it.value))
                  .toList(),
              lineColor: AppColor.orange,
              list: [
                '1H',
                '1D',
                '1W',
                '1M',
                '3M',
                '6M',
                '1Y',
                'ALL',
              ],
              index1: 0,
              onIndexGet: (value) {
                print(value);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  payButton(
                      icon: 'assets/icons/buy.png',
                      title: 'Buy',
                      callback: () {
                        Get.toNamed(AppRoutes.buyCrypto);
                      }),
                  payButton(
                      icon: 'assets/icons/sell.png',
                      title: 'Send',
                      callback: () {
                        Get.toNamed(
                          AppRoutes.sellView,
                        );
                      }),
                  payButton(
                      icon: 'assets/icons/send.png',
                      title: 'Send',
                      callback: () {
                        Get.toNamed(AppRoutes.sendView);
                      }),
                  payButton(
                      icon: 'assets/icons/convert.png',
                      title: 'Convert',
                      callback: () {
                        Get.toNamed(
                          AppRoutes.convertView,
                        );
                      }),
                ],
              ),
            ),
            SizedBox(
              width: AppConfig(context).width / 1.2,
              height: 50,
              child: const Divider(
                color: AppColor.greyText,
              ),
            ),
            homeCoinTile(
              context: context,
              isGraph: false,
              text: "Bitcoin Portfolio",
              text1: "+12.43%",
              price: "CHF 1’533.64",
              percentage: "0.02943",
              padding: 20,
              percentageColor: AppColor.greyText,
              text1Color: AppColor.greyText,
              // maxValue: 10,
              // minValue: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: CustomText(
                  title: "Market Stats",
                  color: AppColor.white,
                  size: 12,
                  fontType: FontType.Onest,
                  fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                homeInfoTile(text: 'Market Cap', text1: '\$335 Billion'),
                const SizedBox(
                  height: 20,
                ),
                homeInfoTile(text: '24H Volume', text1: '\$16 Billion'),
                const SizedBox(
                  height: 20,
                ),
                homeInfoTile(text: 'Circulating Supply', text1: '19 Million'),
                const SizedBox(
                  height: 20,
                ),
                homeInfoTile(text: 'Total Supply', text1: '21 Million')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
