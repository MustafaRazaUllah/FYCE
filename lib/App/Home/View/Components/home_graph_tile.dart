import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget homeGraphTile({
  required BuildContext context,
  required List<FlSpot> data,
  required Color lineColor,
  required double maxValue,
  required double minValue,
  double height = 30,
  double width = 77,
}) {
  return SizedBox(
    height: 100, //height,
    width: width,
    child: LineChart(
      LineChartData(
        borderData: FlBorderData(border: Border.all(color: Colors.transparent)),
        lineTouchData: LineTouchData(enabled: false),
        lineBarsData: [
          LineChartBarData(
            color: lineColor,
            shadow: Shadow(
              color: lineColor,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
            spots: data,
            isCurved: true,
            // isStepLineChart: true,
            isStrokeCapRound: false,
            barWidth: 0.5,
            belowBarData: BarAreaData(
              show: false,
            ),
            dotData: FlDotData(show: false),
          ),
        ],
        minY: minValue,
        maxY: maxValue,
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
      ),
    ),
  );
}
