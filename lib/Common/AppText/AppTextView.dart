import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';

import 'font_type.dart';

class CustomText extends StatelessWidget {
  final String title;
  final TextAlign alignment;
  final TextOverflow txtOverFlow;
  final FontStyle style;
  final double letterSpacce;
  final Color color;
  final TextDecoration textDecoration;
  final FontWeight fontWeight;
  final double size;
  final double height;
  final FontType fontType;
  final int? maxLines;
  const CustomText({
    super.key,
    this.fontType = FontType.Avenir,
    this.size = 14,
    this.fontWeight = FontWeights.regular,
    this.textDecoration = TextDecoration.none,
    this.color = Colors.black,
    this.letterSpacce = 0,
    this.style = FontStyle.normal,
    this.alignment = TextAlign.start,
    this.txtOverFlow = TextOverflow.visible,
    this.height = 1.0,
    this.maxLines,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alignment,
      maxLines: maxLines,
      style: TextStyle(
          overflow: txtOverFlow,
          fontStyle: style,
          letterSpacing: letterSpacce,
          fontFamily: fontType == FontType.Avenir
              ? "Avenir"
              : fontType == FontType.Onest
                  ? "Onest"
                  : "NetHelios",

          //
          color: color,
          decoration: textDecoration,
          fontWeight: fontWeight,
          fontSize: size,
          height: height),
    );
  }
}
