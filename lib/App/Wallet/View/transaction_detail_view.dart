import 'package:biticonapp/Common/AppBar/primary_app_bar.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../Common/AppText/AppTextView.dart';
import '../../../Common/AppText/font_type.dart';
import 'Components/transation_history_detail_tile.dart';
import 'Components/transcation_detail_amount_info.dart';

class TransactionDetailView extends StatelessWidget {
  const TransactionDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Column(
            children: [
              primaryAppBar(
                context: context,
                title: 'Bought Bitcoin',
              ),
              const SizedBox(
                height: 30,
              ),
              transcationDetailAmountInfo(),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: AppConfig(context).width / 1.7,
                child: Divider(color: AppColor.greyText,),
              ),
              const SizedBox(
                height: 30,
              ),
              transactionHistoryDetailTile(
                localCurrencyColor: AppColor.white,
              ),
              const SizedBox(
                height: 20,
              ),
              transactionHistoryDetailTile(
                  heading: "Price", heading2: "CHF 16’750.21"),
              const SizedBox(
                height: 20,
              ),
              transactionHistoryDetailTile(
                  heading: "Date", heading2: " 17:11 - Nov 19, 2023"),
              const SizedBox(
                height: 20,
              ),
              transactionHistoryDetailTile(
                  heading: "Fyce Fee", heading2: "CHF 15.00"),
              const SizedBox(
                height: 20,
              ),
              transactionHistoryDetailTile(
                  heading: "Payment Method", heading2: "1234********6789"),
              const SizedBox(
                height: 20,
              ),
              transactionHistoryDetailTile(
                  heading: "Subtotal", heading2: "CHF 985.00"),
              const SizedBox(
                height: 20,
              ),
              transactionHistoryDetailTile(
                  heading: "Total", heading2: "CHF 1’000.00"),
              const SizedBox(
                height: 20,
              ),
              transactionHistoryDetailTile(
                  heading: "Status", heading2: "Completed"),
            ],
          ),
        ));
  }
}
