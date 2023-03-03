import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/Theme/colors.dart';

import 'package:flutter/material.dart';
import 'dart:math';

Widget portfolioBalanceTile({
  required Color color1,
  required Color color2,
  double height=200,
  double percentage=20,
}) {
  return CustomPaint(
      foregroundPainter: MyPainter(
          completetColor2: color2,
          lineColor: AppColor.greyText,
          completeColor: color1,
          completePercent: percentage,
          width: 3.5),
      child:  Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration:const  BoxDecoration(
              shape: BoxShape.circle,

            ),
            height: height,
          ),
          Column(
            children: const [
              CustomText(
                  title: 'Total',
                  size: 10,
                  color: Color(0xffECF4FF),
                  fontWeight: FontWeight.w300),
              SizedBox(
                height: 5,
              ),
              CustomText(
                  title: 'CF 3000 50', size: 22, fontWeight: FontWeight.w500,color:AppColor.white,),
              SizedBox(
                height: 35,
              ),
              CustomText(
                  title: '47%',
                  size: 20,
                  color: AppColor.orange,
                  fontWeight: FontWeights.medium),
              SizedBox(height: 10,),
              CustomText(
                  title: 'CHF 1’533.64',
                  size: 12,
                  color: Color(0xffECF4FF),
                  fontWeight: FontWeight.w300),
              SizedBox(height: 5,),
              CustomText(
                  title: '0.02943 BTC',
                  size: 12,
                  color: Color(0xffECF4FF),
                  fontWeight: FontWeight.w300),
            ],
          )
        ],
      ));
}

class MyPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  Color completetColor2;
  double completePercent;
  double width;

  MyPainter(
      {required this.lineColor,
      required this.completeColor,
      required this.completePercent,
      required this.completetColor2,
      required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete2 = new Paint()
      ..color = completetColor2
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
    double arcAngle = 1.5 * pi * (completePercent / 100);
    double arcAngle2 = 2 * pi * (completePercent / 100);
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radius), pi / 2,
        arcAngle, false, complete);
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radius),-pi / 2,
        arcAngle2, false, complete2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
