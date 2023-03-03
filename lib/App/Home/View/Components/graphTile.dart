import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

Widget graphTile(
  BuildContext context, {
  required List<FlSpot> data,
  required Color lineColor,
  required List list,
  required int index1,
  required Function(int) onIndexGet,
}) {
  final date = DateFormat.yMEd().format(DateTime.now());
  return Padding(
    padding: const EdgeInsets.only(left: 20,right: 20),
    child: Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              list.length,
              (index) => InkWell(
                onTap: () {
                  onIndexGet(index);
                },
                child: SizedBox(
                  width: AppConfig(context).width / 9,
                  child: CustomText(
                    title: list[index],
                    size: 16,
                    color:
                        index1 == index ? Colors.white : const Color(0xff454545),
                  ),
                ),
              ),
            )),
        const SizedBox(
          height: 4,
        ),
        Container(
          // padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff454545), width: 1),
              borderRadius: BorderRadius.circular(10)),
          height: AppConfig(context).height/3.5,
          width: MediaQuery.of(context).size.width,
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(
                getTouchedSpotIndicator:
                    (LineChartBarData barData, List<int> spotIndexes) {
                  return spotIndexes.map((index) {
                    return TouchedSpotIndicatorData(
                      FlLine(
                        dashArray: [
                          4,
                          2,
                        ],
                        color: lineColor,
                      ),
                      FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                          color: Colors.white,
                          radius: 2,
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                        ),
                      ),
                    );
                  }).toList();
                },
                touchTooltipData: LineTouchTooltipData(
                  tooltipMargin: 30,
                  tooltipRoundedRadius: 20,
                  fitInsideHorizontally: true,
                  fitInsideVertically: true,
                  maxContentWidth: 100,
                  tooltipBgColor: lineColor,
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((LineBarSpot touchedSpot) {
                      return LineTooltipItem(
                          date,
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ));
                    }).toList();
                  },
                ),
                handleBuiltInTouches: true,
                getTouchLineEnd: (_, __) => double.infinity,
                // getTouchLineStart: (data, index) => 100,
              ),
              lineBarsData: [
                LineChartBarData(
                  shadow: Shadow(
                      color: lineColor,
                      blurRadius: 10,
                      offset: const Offset(0, 2)),
                  color: lineColor,
                  spots: data,
                  isCurved: false,
                  isStrokeCapRound: false,
                  barWidth: 2,
                  belowBarData: BarAreaData(
                    show: false,
                  ),
                  dotData: FlDotData(show: false),
                ),
              ],
              minY: -4,
              maxY: 4,

              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                    reservedSize: 0,
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(
                show: false,
                drawHorizontalLine: false,
                drawVerticalLine: false,
                horizontalInterval: 1.5,
                verticalInterval: 5,
                checkToShowHorizontalLine: (value) {
                  return value.toInt() == 0;
                },
                checkToShowVerticalLine: (value) {
                  return value.toInt() == 0;
                },
              ),

              borderData: FlBorderData(show: false),
              // showingTooltipIndicators:
            ),
          ),
        ),
      ],
    ),
  );
}
