import 'package:biticonapp/App/Home/View/Components/home_coin_tile.dart';
import 'package:biticonapp/App/Home/Viewmodel/home_viewmodel.dart';
import 'package:biticonapp/App/RootPage/ViewModel/root_view_model.dart';
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:biticonapp/RoutesAndBindings/app_routes.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/AppBTN/pay_button.dart';
import '../../../Common/custom_botttom_sheet.dart';
import '../../Buy/View/crypto_listing_sheet.dart';

import '../../Send/View/crypto_send_listing_sheet.dart';
import 'Components/blance_tile_home.dart';
import 'Components/home_graph_tile.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final rootVM = Get.find<RootViewModel>();
  final _serviceVM = Get.find<HomeViewModel>();
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
              title: "Hello John",
              color: AppColor.white,
              size: 24,
              fontWeight: FontWeights.bold,
              fontType: FontType.Onest,
            ),
            homeBalanceTile(context: context),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  payButton(
                    icon: 'assets/icons/send.png',
                    title: 'Transfer',
                    callback: () {
                      customBottomSheet(
                        context: context,
                        child: CryptoSendListingSheet(),
                      );
                    },
                  ),
                  payButton(
                    icon: 'assets/icons/buy.png',
                    title: 'Buy',
                    callback: () {
                      customBottomSheet(
                        context: context,
                        child: CryptoListingSheet(),
                      );
                    },
                  ),
                  payButton(
                    icon: 'assets/icons/pay.png',
                    title: 'Pay',
                    callback: () {
                      customBottomSheet(
                        context: context,
                        child: CryptoSendListingSheet(),
                      );
                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: AppConfig(context).width / 2,
                child: const Divider(
                  color: AppColor.greyText,
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  itemCount: _serviceVM.coinDataList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: homeCoinTile(
                        context: context,
                        text: _serviceVM.coinDataList[index].ticker,
                        text1: _serviceVM.coinDataList[index].ticker,
                        price:
                            "CHF ${double.parse(_serviceVM.coinDataList[index].price).toStringAsFixed(2)}",
                        percentage:
                            "${double.parse(_serviceVM.coinDataList[index].lotVolume).toStringAsFixed(2)}%",
                        text1Color: AppColor.white,
                        callback: () {
                          rootVM.changeWallet(true);
                          rootVM.changeIndex(2);
                          // Get.toNamed(AppRoutes.coinDetailView);
                        },
                        graphList: _serviceVM.coinDataList[index].ticker ==
                                "XBT/USD"
                            ? _serviceVM.xBT
                            : _serviceVM.coinDataList[index].ticker == "USD/USD"
                                ? _serviceVM.uSD
                                : _serviceVM.coinDataList[index].ticker ==
                                        "ICP/USD"
                                    ? _serviceVM.iCP
                                    : _serviceVM.coinDataList[index].ticker ==
                                            "MATIC/USD"
                                        ? _serviceVM.mATIC
                                        : _serviceVM.aDA,
                        minValue: _serviceVM.coinDataList[index].ticker ==
                                "XBT/USD"
                            ? _serviceVM.xBTMaxMin.reduce((value, element) =>
                                value > element ? value : element)
                            : _serviceVM.coinDataList[index].ticker == "USD/USD"
                                ? _serviceVM.uSDMaxMin.reduce((value, element) =>
                                    value > element ? value : element)
                                : _serviceVM.coinDataList[index].ticker ==
                                        "ICP/USD"
                                    ? _serviceVM.iCPMaxMin.reduce((value, element) =>
                                        value > element ? value : element)
                                    : _serviceVM.coinDataList[index].ticker ==
                                            "MATIC/USD"
                                        ? _serviceVM.mATICMaxMin.reduce((value,
                                                element) =>
                                            value > element ? value : element)
                                        : _serviceVM.aDAMaxMin.reduce(
                                            (value, element) => value > element ? value : element),
                        maxValue: _serviceVM.coinDataList[index].ticker ==
                                "XBT/USD"
                            ? _serviceVM.xBTMaxMin.reduce((value, element) =>
                                value < element ? value : element)
                            : _serviceVM.coinDataList[index].ticker == "USD/USD"
                                ? _serviceVM.uSDMaxMin.reduce((value, element) =>
                                    value < element ? value : element)
                                : _serviceVM.coinDataList[index].ticker ==
                                        "ICP/USD"
                                    ? _serviceVM.iCPMaxMin.reduce((value, element) =>
                                        value < element ? value : element)
                                    : _serviceVM.coinDataList[index].ticker ==
                                            "MATIC/USD"
                                        ? _serviceVM.mATICMaxMin.reduce((value,
                                                element) =>
                                            value < element ? value : element)
                                        : _serviceVM.aDAMaxMin.reduce(
                                            (value, element) => value < element ? value : element),
                        isRise: _serviceVM.coinDataList[index].ticker ==
                                "XBT/USD"
                            ? _serviceVM.isRiseXBT.value
                            : _serviceVM.coinDataList[index].ticker == "USD/USD"
                                ? _serviceVM.isRiseUSD.value
                                : _serviceVM.coinDataList[index].ticker ==
                                        "ICP/USD"
                                    ? _serviceVM.isRiseICP.value
                                    : _serviceVM.coinDataList[index].ticker ==
                                            "MATIC/USD"
                                        ? _serviceVM.isRiseMATIC.value
                                        : _serviceVM.isRiseADA.value,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
