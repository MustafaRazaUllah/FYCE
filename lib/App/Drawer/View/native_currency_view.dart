


import 'package:biticonapp/App/Drawer/View/Components/native_currency_tile.dart';
import 'package:biticonapp/App/Home/View/Components/graphTile.dart';
import 'package:biticonapp/Common/AppBTN/radio_button.dart';
import 'package:biticonapp/Common/AppBar/primary_app_bar.dart';
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class NativeCurrencyScreen extends StatelessWidget {
  const NativeCurrencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.strokeGrey,
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          children: [
            primaryAppBar(
              context: context,
              title: 'Native Currency',
            ),


            const SizedBox(
              height: 40,
            ),
            nativeCurrencyTile(text: 'CHF', isSelected: true),
            const SizedBox(
              height: 10,
            ),

            nativeCurrencyTile(text: 'USD', isSelected: false),
            const SizedBox(
              height: 10,
            ),

            nativeCurrencyTile(text: 'EUR', isSelected: false),


          ],
        ),
      ),
    );
  }
}
