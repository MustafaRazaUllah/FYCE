import 'package:biticonapp/App/Auth/View/sign_in_view.dart';
import 'package:biticonapp/App/Wallet/View%20Model/wallet_viewmodel.dart';
import 'package:biticonapp/App/Wallet/View/Components/wallet_tile.dart';
import 'package:biticonapp/Common/Network/api_urls.dart';
import 'package:biticonapp/Common/Network/cache_handler.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:biticonapp/RoutesAndBindings/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/AppText/AppTextView.dart';
import '../../../Common/AppText/font_type.dart';

class WalletView extends StatelessWidget {
  WalletView({Key? key}) : super(key: key);

  final _serviceVM = Get.find<WalletViewModel>();
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
              title: "Wallets",
              color: AppColor.white,
              size: 24,
              fontWeight: FontWeights.bold,
              fontType: FontType.Onest,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: _serviceVM.wellatsList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    childAspectRatio: 1.05),
                itemBuilder: (context, index) {
                  return walletTile(
                    callback: () async {
                      var token = await DatabaseHandler().getToken();
                      if (token != "") {
                        print("object => $token");
                        if (_serviceVM.wellatsList[index].title == "BTC") {
                          Get.toNamed(
                            AppRoutes.walletDetailView,
                            arguments: _serviceVM.wellatsList[index].title,
                          );
                          _serviceVM.getWallet(ApiManager.BITCOIN_WALLET);
                        } else if (_serviceVM.wellatsList[index].title ==
                            "ETH") {
                          Get.toNamed(
                            AppRoutes.walletDetailView,
                            arguments: _serviceVM.wellatsList[index].title,
                          );
                          _serviceVM.getWallet(ApiManager.ETHEREUM_WALLET);
                        } else if (_serviceVM.wellatsList[index].title ==
                            "MATIC") {
                          Get.toNamed(
                            AppRoutes.walletDetailView,
                            arguments: _serviceVM.wellatsList[index].title,
                          );
                          _serviceVM.getWallet(ApiManager.MATIC_WALLET);
                        } else if (_serviceVM.wellatsList[index].title ==
                            "ADA") {
                          Get.toNamed(
                            AppRoutes.walletDetailView,
                            arguments: _serviceVM.wellatsList[index].title,
                          );
                        } else if (_serviceVM.wellatsList[index].title ==
                            "USDC") {
                          Get.toNamed(
                            AppRoutes.walletDetailView,
                            arguments: _serviceVM.wellatsList[index].title,
                          );
                          _serviceVM.getWallet(ApiManager.USDC_WALLET);
                        } else if (_serviceVM.wellatsList[index].title ==
                            "ICP") {
                          Get.toNamed(
                            AppRoutes.walletDetailView,
                            arguments: _serviceVM.wellatsList[index].title,
                          );
                        }
                      } else {
                        Get.to(
                          SignInView(fromOther: true),
                        );
                      }
                    },
                    title: _serviceVM.wellatsList[index].title,
                    currencyname: _serviceVM.wellatsList[index].currencyName,
                    title2: _serviceVM.wellatsList[index].title2,
                    backgroundColor:
                        Color(_serviceVM.wellatsList[index].currencyColor),
                    textColor:
                        Color(_serviceVM.wellatsList[index].currencyTextColor),
                    riseValue: _serviceVM.wellatsList[index].risevalue,
                    icon: _serviceVM.wellatsList[index]
                        .currencyImage, //"assets/images/Bitcoin.png",
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// {
//       "title": "Bitcoin",
//       "title2": "0.0643 BTC",
//       "risevalue": "+12.322%",
//       "icon": "assets/images/Bitcoin.png",
//     },
//     {
//       "title": "Ethereum",
//       "title2": "0.09363 ETH",
//       "risevalue": "-9.393%",
//       "icon": "assets/images/Ethereum.png",
//     },
//     {
//       "title": "Matic",
//       "title2": "0.02356 BCH",
//       "risevalue": "+12.352%",
//       "icon": "assets/images/BitcoinCash.png",
//     },
//     {
//       "title": "Litecoin",
//       "title2": "0.09642 LTC",
//       "risevalue": "-12.232%",
//       "icon": "assets/images/Litecoin.png",
//     }
