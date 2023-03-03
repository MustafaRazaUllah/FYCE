import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpFormFields extends StatelessWidget {
  Function onComplete;
  OtpFormFields({Key? key, required this.onComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 4,
      obscureText: false,
      textStyle: const TextStyle(color: AppColor.white),
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(18),
        fieldHeight: 75,
        fieldWidth: AppConfig(context).width / 5,
        activeFillColor: AppColor.greyText.withOpacity(0.5),
        selectedColor: AppColor.white,
        activeColor: AppColor.white,
        inactiveColor: AppColor.primaryColor,
        selectedFillColor: AppColor.greyText.withOpacity(0.5),
        borderWidth: 0.5,
        inactiveFillColor: AppColor.greyText.withOpacity(0.5),
        disabledColor: AppColor.red,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: AppColor.primaryColor,
      cursorColor: AppColor.white,
      cursorHeight: 2,
      cursorWidth: AppConfig(context).width * 0.07,
      enableActiveFill: true,
      controller: TextEditingController(),
      onCompleted: (v) {
        onComplete(v);
        //
        debugPrint("Completed");
      },
      onChanged: (value) {
        debugPrint(value);
      },
      beforeTextPaste: (text) {
        return true;
      },
      appContext: context,
    );
  }
}
