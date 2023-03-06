import 'package:biticonapp/App/Home/Model/home_model.dart';
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'home_graph_tile.dart';

Widget homeCoinTile({
  required BuildContext context,
  VoidCallback? callback,
  Function? printback,
  // List<FlSpot> graphList = const [FlSpot(1, 0.0)],
  List<double> graphList = const [],
  bool isGraph = true,
  String price = "CHF 16’533.64",
  String percentage = "+12.23%",
  String text = "Bitcoin",
  String text1 = "Btc",
  double padding = 0,
  String image = "assets/images/Bitcoin.png",
  Color percentageColor = AppColor.onboard,
  Color text1Color = AppColor.white,
}) {
  return InkWell(
    onTap: callback,
    child: Container(
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: AppColor.greyText.withOpacity(0.4)))),
      child: Padding(
        padding: EdgeInsets.only(
          left: padding,
          right: padding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(image)),
                    color: AppColor.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        title: text,
                        color: AppColor.white,
                        size: 17,
                        fontType: FontType.Avenir,
                        fontWeight: FontWeight.w300),
                    CustomText(
                        title: text1,
                        color: text1Color,
                        size: 14,
                        fontWeight: FontWeight.w500),
                  ],
                ),
              ],
            ),
            isGraph
                ? SizedBox(
                    height: 50,
                    child: homeGraphTile(
                      context: context,
                      // data: graphList,
                      // data: graphList.map(
                      //   (val) {
                      //     double index = 0.0;
                      //     //     double.parse(graphList.indexOf(val).toString());

                      //     if (text == "XBT/USD") {
                      //       printback!(index++);
                      //     }
                      //     return FlSpot(index++, val);
                      //   },
                      // ).toList(),
                      data: graphList.asMap().entries.map(
                        (entry) {
                          //     double.parse(graphList.indexOf(val).toString());
                          double idx = double.parse(entry.key.toString());
                          if (text == "XBT/USD") {
                            printback!(idx);
                          }
                          return FlSpot(idx, entry.value);
                        },
                      ).toList(),
                      lineColor: (graphList[graphList.length - 2] >
                              double.parse(graphList.last.toString()))
                          ? AppColor.red
                          : AppColor.green,
                      height: 50,
                      width: 100,
                      maxValue: graphList.reduce((value, element) =>
                          value > element ? value : element),
                      minValue: graphList.reduce((value, element) =>
                          value < element ? value : element),
                      // maxValue: maxValue,
                      // minValue: minValue,
                    ),
                  )
                : SizedBox.shrink(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(
                    title: price,
                    color: AppColor.white,
                    size: 17,
                    fontType: FontType.Avenir,
                    fontWeight: FontWeight.w300),
                CustomText(
                    title: (graphList[graphList.length - 2] >
                            double.parse(graphList.last.toString()))
                        ? "-$percentage"
                        : "+$percentage",
                    color: (graphList[graphList.length - 2] >
                            double.parse(graphList.last.toString()))
                        ? AppColor.red
                        : AppColor.green,
                    size: 14,
                    fontWeight: FontWeight.w500),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
