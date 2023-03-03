import 'package:biticonapp/App/Home/View/Components/home_graph_tile.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Common/AppText/AppTextView.dart';

Widget homeBalanceTile({required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
    child: Container(
      height: AppConfig(context).height / 4.5,
      width: AppConfig(context).width,
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.greyText, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: homeGraphTile(
              context: context,
              data: [
                FlSpot(1, 0.0),
                FlSpot(2, 0.5),
                FlSpot(3, -1.5),
                FlSpot(4, 1.5),
                FlSpot(5, -1.7),
                FlSpot(6, 0.0),
                FlSpot(7, -0.4),
                FlSpot(8, 1.0),
                FlSpot(9, -0.6),
                FlSpot(10, 0.5),
                FlSpot(11, 0.4),
                FlSpot(12, 1.6),
                FlSpot(13, 1.7),
              ],
              lineColor: AppColor.green.withOpacity(0.4),
              height: AppConfig(context).height / 4.5,
              width: AppConfig(context).width / 2,
              maxValue: 3,
              minValue: -3,
            ),
          ),
          SizedBox(
            width: AppConfig(context).width,
            child: Column(
              children: [
                const CustomText(
                  title: "Total balance",
                  color: AppColor.white,
                  size: 15,
                  fontWeight: FontWeights.regular,
                  fontType: FontType.Onest,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  title: "CHF 53’540.00",
                  color: AppColor.white,
                  size: 35,
                  fontWeight: FontWeights.medium,
                  fontType: FontType.Avenir,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 22,
                  width: 60,
                  padding: const EdgeInsets.only(left: 2, right: 2, top: 2),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage("assets/icons/triangle.png"),
                        height: 12,
                        width: 12,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        title: "10%",
                        color: AppColor.black,
                        size: 12,
                        height: 1.6,
                        fontWeight: FontWeights.extraBold,
                        fontType: FontType.Avenir,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                const CustomText(
                  title: "CHF 12´450.34",
                  color: AppColor.onboard,
                  size: 14,
                  fontWeight: FontWeights.regular,
                  fontType: FontType.Avenir,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
