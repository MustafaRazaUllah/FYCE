import 'package:biticonapp/App/Buy/View/Components/add_card_tile.dart';
import 'package:biticonapp/App/SellAndWithdraw/View/add_bank_view.dart';
import 'package:biticonapp/Common/AppBar/primary_app_bar.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:biticonapp/Common/custom_botttom_sheet.dart';
import 'package:biticonapp/RoutesAndBindings/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Send/View/Components/send_blance_tile.dart';
import 'Componnets/bank_tile.dart';

class SellView extends StatelessWidget {
  const SellView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            primaryAppBar(
                context: context, title: 'Sell & Withdraw', isWallet: true),

            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 10, right: 10),
              child: sendBalanceTile(
                  walletPrice: '1.23754',
                  price: '1.12',
                  converterPrice: 'CHF 23’189.21',
                  context: context),
            ),

            Expanded(

              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return index==2?Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: addCardTile(
                          isBank: true,
                          callback: () {
                            customBottomSheet(context: context, child: AddBankView());
                          }),
                    ):Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: bankTile(context: context,callback: (){
                            Get.toNamed(AppRoutes.withDrawPreview, );
                          }),
                        );
                  }),
            ),

          ],
        ),
      ),
    );
  }
}
