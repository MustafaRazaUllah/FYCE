import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';

customBottomSheet({required BuildContext context,required Widget child}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColor.transparent,
      builder: (context) {
        return  child;
      });
}