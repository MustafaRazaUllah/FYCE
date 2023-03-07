import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:biticonapp/Common/custom_alert.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../Common/AppText/AppTextView.dart';
import '../../../../Common/AppText/font_type.dart';
import '../../../../Common/Constant/AppConfig.dart';
import '../../../Home/View/Components/home_graph_tile.dart';

Widget walletDetailCoin({
  required BuildContext context,
  required String walletName,
  required String walletBalance,
  required String walletAddress,
}) {
  return Column(
    children: [
      Container(
        height: AppConfig(context).height / 2,
        width: AppConfig(context).width / 1.1,
        padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth * 0.05,
          SizeConfig.screenWidth * 0.07,
          SizeConfig.screenWidth * 0.05,
          SizeConfig.screenWidth * 0.03,
        ),
        decoration: BoxDecoration(
          color: Color(0xff3B60F8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title: "TOTAL BALANCE",
              color: AppColor.white,
              fontType: FontType.Onest,
              fontWeight: FontWeight.w300,
              size: SizeConfig.screenWidth * 0.032,
            ),
            const SizedBox(height: 10),
            CustomText(
              title: "CHF 1’533.64",
              color: AppColor.white,
              fontType: FontType.Onest,
              // fontWeight: FontWeights.regular,
              // size: 14,
              fontWeight: FontWeight.w900,
              size: SizeConfig.screenWidth * 0.06,
            ),
            Expanded(
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
                  FlSpot(13, 2),
                ],
                maxValue: 3,
                minValue: -3,
                lineColor: AppColor.primaryColor,
                width: double.infinity,
              ),
            ),

            // Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: "0.02943 BTC",
                  color: AppColor.greyLight,
                  fontType: FontType.Onest,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  size: SizeConfig.screenWidth * 0.032,
                ),
                Spacer(),
                CustomText(
                  title: "+12.43%",
                  color: AppColor.onboard,
                  fontType: FontType.Onest,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  size: SizeConfig.screenWidth * 0.032,
                ),
              ],
            ),
            // Spacer(),

            Container(
              color: Colors.transparent,
              height: 140,
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  "BTC",
                  textWidthBasis: TextWidthBasis.parent,
                  style: TextStyle(
                    fontSize: SizeConfig.screenWidth * 0.35,
                    fontFamily: "Onest",
                    color: AppColor.primaryColor,
                    fontWeight: FontWeights.extraBold,
                    height: 0.0,
                  ),
                ),
              ), // FittedBox(
            ),
          ],
        ),
      ),
      SizedBox(height: 10),
      SizedBox(
        height: 70,
        width: AppConfig(context).width / 1.1,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  await Clipboard.setData(
                    ClipboardData(text: walletAddress),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Copied  ${walletAddress}"),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.popUpButtonColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: "YOUR WALLET ADDRESS",
                        color: AppColor.primaryColor,
                        fontType: FontType.Onest,
                        fontWeight: FontWeight.w300,
                        size: SizeConfig.screenWidth * 0.033,
                      ),
                      SizedBox(height: 6),
                      CustomText(
                        title: walletAddress, //"Bitcoin",
                        color: AppColor.greyText,
                        fontType: FontType.Onest,
                        fontWeight: FontWeight.w400,
                        maxLines: 1,
                        txtOverFlow: TextOverflow.ellipsis,
                        size: SizeConfig.screenWidth * 0.033,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return QRCodeAlertBox(
                      title: "YOUR WALLET ADDRESS",
                      height: 400,
                      qrCodeData: walletAddress.toString(),
                    );
                  },
                );
              },
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.transparent,
                  border: Border.all(
                    color: Color(0xff3B60F8),
                    width: 0.4,
                  ),
                ),
                child: Center(
                  child: CustomText(
                    alignment: TextAlign.center,
                    title: "QR\nCODE",
                    color: AppColor.white,
                    size: SizeConfig.screenWidth * 0.034,
                    height: 1.3,
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}

// Widget walletDetailCoin({
//   required BuildContext context,
//   required String walletName,
//   required String walletBalance,
//   required String walletAddress,
// }) {
//   return Container(
//     height: AppConfig(context).height / 4,
//     width: AppConfig(context).width / 1.1,
//     padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(
//           color: AppColor.greyText,
//         )),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 CustomText(
//                   title: walletName, //"Bitcoin",
//                   color: AppColor.white,
//                   fontType: FontType.Onest,
//                   fontWeight: FontWeights.bold,
//                   size: 14,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const CustomText(
//                   title: "CHF 1’533.64",
//                   color: AppColor.white,
//                   fontType: FontType.Onest,
//                   fontWeight: FontWeights.regular,
//                   size: 14,
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 walletBalance.isNotEmpty || walletBalance != ""
//                     ? CustomText(
//                         title: walletBalance, //"0.02943 BTC",
//                         color: AppColor.orange,
//                         fontType: FontType.Onest,
//                         fontWeight: FontWeights.regular,
//                         size: 14,
//                       )
//                     : SizedBox(
//                         height: 10,
//                         child: SpinKitWave(
//                           itemBuilder: (BuildContext context, int index) {
//                             return DecoratedBox(
//                               decoration: BoxDecoration(
//                                 color: AppColor.orange,
//                                 borderRadius: BorderRadius.circular(100),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 CustomText(
//                   title: "+12.43%",
//                   color: AppColor.onboard.withOpacity(0.3),
//                   fontType: FontType.Onest,
//                   fontWeight: FontWeights.bold,
//                   size: 14,
//                 ),
//               ],
//             ),
//             Spacer(),
//             homeGraphTile(
//                 context: context,
//                 data: [
//                   FlSpot(1, 0.0),
//                   FlSpot(2, 0.5),
//                   FlSpot(3, -1.5),
//                   FlSpot(4, 1.5),
//                   FlSpot(5, -1.7),
//                   FlSpot(6, 0.0),
//                   FlSpot(7, -0.4),
//                   FlSpot(8, 1.0),
//                   FlSpot(9, -0.6),
//                   FlSpot(10, 0.5),
//                   FlSpot(11, 0.4),
//                   FlSpot(12, 1.6),
//                   FlSpot(13, 2),
//                 ],
//                 maxValue: 3,
//                 minValue: -3,
//                 lineColor: AppColor.orange,
//                 height: AppConfig(context).height / 7,
//                 width: AppConfig(context).width / 2.5),
//             Column(
//               children: [
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   height: 40,
//                   width: 40,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage("assets/images/Bitcoin.png")),
//                     color: AppColor.white,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//         Spacer(),
//         const CustomText(
//           title: "Your Wallet Address",
//           color: AppColor.greyText,
//           fontType: FontType.Onest,
//           fontWeight: FontWeights.regular,
//           size: 12,
//         ),
//         Container(
//           height: 40,
//           width: AppConfig(context).width,
//           padding: EdgeInsets.symmetric(horizontal: 10),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: AppColor.strokeGrey),
//           child: walletAddress.isNotEmpty || walletAddress != ""
//               ? Row(
//                   children: [
//                     Expanded(
//                       child: CustomText(
//                         title:
//                             walletAddress, //"1DhQop23bvsidojskfapCPH9AeKTb2p",
//                         color: AppColor.greyLightShade,
//                         fontType: FontType.Onest,
//                         fontWeight: FontWeight.w300,
//                         maxLines: 1,
//                         txtOverFlow: TextOverflow.ellipsis,
//                         size: 14,
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () async {
//                         await Clipboard.setData(
//                           ClipboardData(text: walletAddress),
//                         );
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text("Copied ${walletAddress}"),
//                           ),
//                         );
//                       },
//                       child: const Image(
//                         image: AssetImage('assets/icons/copy.png'),
//                       ),
//                     ),
//                   ],
//                 )
//               : Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 15.0),
//                   child: SizedBox(
//                     height: 10,
//                     child: SpinKitWave(
//                       itemBuilder: (BuildContext context, int index) {
//                         return DecoratedBox(
//                           decoration: BoxDecoration(
//                             color: AppColor.orange,
//                             borderRadius: BorderRadius.circular(100),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//         )
//       ],
//     ),
//   );
// }
