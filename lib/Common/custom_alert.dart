import 'dart:ui';

import 'package:biticonapp/Common/AppBTN/primary_btn.dart';
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CustomAlertBox extends StatelessWidget {
  String? title;
  String? description;
  String? imagePath;
  String? btnText;
  double? height;
  VoidCallback? callback;
  Widget? customerWidget;

  CustomAlertBox({
    super.key,
    this.title,
    this.description,
    this.imagePath,
    this.height,
    this.btnText,
    this.customerWidget,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: customerWidget ??
              Container(
                height: height ?? 320,
                width: SizeConfig.screenWidth * 0.9,
                decoration: new BoxDecoration(
                  color: AppColor.popupColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: AppColor.strokeGrey,
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                      title: title!, //"Successfully Verified",
                      fontWeight: FontWeights.extraBold,
                      size: SizeConfig.screenWidth * 0.05,
                      color: AppColor.onboard,
                    ),
                    imagePath != null
                        ? Image.asset(
                            imagePath!,
                            width: SizeConfig.screenWidth * 0.3,
                            height: SizeConfig.screenWidth * 0.3,
                          )
                        : description != null
                            ? CustomText(
                                title: description!,
                                fontWeight: FontWeights.extraBold,
                                size: SizeConfig.screenWidth * 0.05,
                                color: AppColor.onboard,
                              )
                            : SizedBox(),
                    if (btnText != null)
                      PrimaryBTN(
                        callback: () {
                          Navigator.pop(context);
                          if (callback != null) {
                            callback!();
                          }
                        },
                        width: SizeConfig.screenWidth * 0.34,
                        textCLR: AppColor.primaryColor,
                        color: AppColor.popUpButtonColor,
                        height: 50,
                        isOnBoard: true,
                        borderRadius: 0,
                        title: btnText!,
                        fontWeight: FontWeights.extraBold,
                      ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}

class QRCodeAlertBox extends StatelessWidget {
  String title;
  String qrCodeData;
  double? height;

  QRCodeAlertBox({
    super.key,
    required this.title,
    required this.qrCodeData,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            height: height ?? 320,
            width: SizeConfig.screenWidth * 0.9,
            decoration: new BoxDecoration(
              color: AppColor.popupColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: AppColor.strokeGrey,
                width: 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  title: title, //"Successfully Verified",
                  fontWeight: FontWeights.extraBold,
                  size: SizeConfig.screenWidth * 0.05,
                  color: AppColor.onboard,
                ),
                // QrImage(
                //   data: qrCodeData,
                //   version: QrVersions.auto,
                //   size: 200.0,
                // ),
                QrImage(
                  data: qrCodeData,
                  version: QrVersions.auto,
                  foregroundColor: AppColor.white,
                  size: 300,
                  gapless: false,
                )
                // QrImage(
                //   data: 'This QR code will show the error state instead',
                //   version: 1,
                //   size: 320,
                //   gapless: false,
                //   errorStateBuilder: (cxt, err) {
                //     return Container(
                //       child: Center(
                //         child: Text(
                //           "Uh oh! Something went wrong...",
                //           textAlign: TextAlign.center,
                //         ),
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
