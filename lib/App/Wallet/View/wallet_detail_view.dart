import 'package:biticonapp/App/Wallet/View%20Model/wallet_viewmodel.dart';
import 'package:biticonapp/App/Wallet/View/Components/wallet_detail_tile.dart';
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Common/AppBar/primary_app_bar.dart';
import '../../../RoutesAndBindings/app_routes.dart';
import 'Components/transation_history_tile.dart';

class WalletDetailView extends StatelessWidget {
  WalletDetailView({Key? key}) : super(key: key);

  final _serviceVM = Get.find<WalletViewModel>();

  final walletName = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 0, top: 50),
        child: Obx(
          () => Column(
            children: [
              primaryAppBar(
                  context: context,
                  title: '${walletName} Wallet',
                  isWallet: true,
                  fontSize: 24,
                  fontType: FontType.Avenir),
              const SizedBox(
                height: 10,
              ),
              walletDetailCoin(
                context: context,
                walletName: walletName,
                walletBalance: _serviceVM.wellatDetail.value.balance.toString(),
                walletAddress: _serviceVM.wellatDetail.value.address.toString(),
              ),
              SizedBox(
                height: AppConfig(context).height / 12,
              ),
              const Divider(
                color: AppColor.greyText,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CustomText(
                    title: "Transaction History",
                    color: AppColor.white,
                    fontType: FontType.Onest,
                    fontWeight: FontWeights.bold,
                    size: 12,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return transactionHistory(
                      callback: () {
                        Get.toNamed(AppRoutes.transactionDetailView);
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
