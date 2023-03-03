import 'package:biticonapp/App/Home/View/coin_tile_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Common/Theme/colors.dart';
import '../../Drawer/View/drawer_view.dart';
import '../../Home/View/home_view.dart';
import '../../Portfolio/View/portfolio_view.dart';
import '../../Wallet/View/wallet_view.dart';
import '../ViewModel/root_view_model.dart';
import 'nav_tile.dart';

class NavbarView extends StatelessWidget {
  NavbarView({
    Key? key,
  }) : super(key: key);

  final rootVM = Get.find<RootViewModel>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (rootVM.currentItem.value == 0) {
            return true;
          } else {
            rootVM.changeIndex(0);
            return false;
          }
        },
        child: Obx(
          () => AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(
                systemNavigationBarColor: AppColor.primaryColor,
                statusBarColor: AppColor.primaryColor,
                systemNavigationBarDividerColor: AppColor.primaryColor),
            child: Scaffold(
              key: rootVM.scaffoldKey,
              drawer: const DrawerView(),
              backgroundColor: AppColor.primaryColor,
              bottomNavigationBar: Container(
                height: 75,
                padding: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                    color: AppColor.primaryColor,
                    border: Border(top: BorderSide(color: AppColor.greyText))),
                child: Row(
                  children: [
                    NavBarTile(
                      callback: () {
                        rootVM.changeIndex(0);
                      },
                      color: AppColor.primaryColor,
                      // background: Colors.amber,
                      icon: ImageIcon(
                        const AssetImage("assets/icons/navBar/home.png"),
                        size: 24,
                        color: rootVM.currentItem.value == 0
                            ? AppColor.white
                            : const Color(0xFF999B9F),
                      ),
                      title: "",
                      isSelected: rootVM.currentItem.value == 0 ? true : false,
                    ),
                    NavBarTile(
                      callback: () {
                        rootVM.changeIndex(1);
                      },
                      color: AppColor.primaryColor,
                      icon: ImageIcon(
                        const AssetImage("assets/icons/navBar/portoflio.png"),
                        size: 24,
                        color: rootVM.currentItem.value == 1
                            ? AppColor.white
                            : const Color(0xFF999B9F),
                      ),
                      title: "",
                      isSelected: rootVM.currentItem.value == 1 ? true : false,
                    ),
                    NavBarTile(
                      callback: () {
                        rootVM.changeWallet(false);
                        rootVM.changeIndex(2);
                      },
                      color: AppColor.primaryColor,
                      icon: ImageIcon(
                        const AssetImage("assets/icons/navBar/wallet.png"),
                        size: 24,
                        color: rootVM.currentItem.value == 2
                            ? AppColor.white
                            : const Color(0xFF999B9F),
                      ),
                      title: "",
                      isSelected: rootVM.currentItem.value == 2 ? true : false,
                    ),
                    NavBarTile(
                      callback: () {
                        rootVM.scaffoldKey.currentState!.openDrawer();
                      },
                      color: AppColor.primaryColor,
                      isSelected: rootVM.currentItem.value == 3 ? true : false,
                      icon: ImageIcon(
                        const AssetImage("assets/icons/navBar/profile.png"),
                        size: 24,
                        color: rootVM.currentItem.value == 3
                            ? AppColor.white
                            : const Color(0xFF999B9F),
                      ),
                      title: "",
                    ),
                  ],
                ),
              ),
              body: [
                HomeView(),
                PortfolioView(),
                Obx(() =>
                    rootVM.isWallet.value ? CoinDetailView() : WalletView()),
              ][rootVM.currentItem.value],
            ),
          ),
        ));
  }
}
