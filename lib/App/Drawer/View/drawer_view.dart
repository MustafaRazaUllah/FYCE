import 'package:biticonapp/App/Drawer/View/Components/drawer_general_tile.dart';
import 'package:biticonapp/Common/AppBTN/primary_btn.dart';
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:biticonapp/Common/Network/cache_handler.dart';
import 'package:biticonapp/RoutesAndBindings/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Common/AppText/font_type.dart';
import '../../../Common/Theme/colors.dart';
import 'Components/drawer_security_tile.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: AppColor.strokeGrey,
          statusBarColor: AppColor.strokeGrey,
          systemNavigationBarDividerColor: AppColor.strokeGrey),
      child: Container(
        width: AppConfig(context).width,
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: AppConfig(context).width / 1.3,
              color: AppColor.strokeGrey,
              padding: EdgeInsets.only(
                  left: 20, right: 20, top: AppConfig(context).height / 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      CustomText(
                          title: "John Doe",
                          size: 18,
                          fontWeight: FontWeights.bold,
                          fontType: FontType.Onest,
                          color: AppColor.white),
                      Spacer(),
                      Image(
                        image: AssetImage("assets/icons/person.png"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomText(
                      title: "General",
                      size: 14,
                      fontWeight: FontWeights.bold,
                      fontType: FontType.Onest,
                      color: AppColor.greyLightShade),
                  const SizedBox(
                    height: 15,
                  ),
                  drawerGeneralTile(
                      heading: 'Account Type',
                      subHeading: 'Unverified',
                      callback: () {
                        Get.toNamed(
                          AppRoutes.accountTypeView,
                        );
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  drawerGeneralTile(
                      heading: 'Native Currency',
                      subHeading: 'CHF',
                      callback: () {
                        Get.toNamed(AppRoutes.nativeCurrencyScreen);
                      }),
                  SizedBox(
                    height: AppConfig(context).height / 10,
                  ),
                  const CustomText(
                      title: "Security",
                      size: 14,
                      fontWeight: FontWeights.bold,
                      fontType: FontType.Onest,
                      color: AppColor.greyLightShade),
                  const SizedBox(
                    height: 15,
                  ),
                  drawerSecurityTile(heading: 'PIN Code', value: false),
                  const SizedBox(
                    height: 10,
                  ),
                  drawerSecurityTile(heading: 'Face ID', value: true),
                  const SizedBox(
                    height: 15,
                  ),
                  drawerGeneralTile(
                      heading: 'My Recovery Phrase',
                      subHeading: '',
                      callback: () {
                        Get.toNamed(AppRoutes.recoveryWalletKeyView);
                      }),
                  SizedBox(
                    height: AppConfig(context).height / 12,
                  ),
                  const CustomText(
                      title: "About Us",
                      size: 14,
                      fontWeight: FontWeights.bold,
                      fontType: FontType.Onest,
                      color: AppColor.greyLightShade),
                  const SizedBox(
                    height: 30,
                  ),
                  drawerGeneralTile(
                      heading: 'Terms & Conditions', subHeading: ''),
                  const SizedBox(
                    height: 20,
                  ),
                  drawerGeneralTile(heading: 'Privacy Policy', subHeading: ''),
                  const SizedBox(
                    height: 20,
                  ),
                  drawerGeneralTile(heading: 'Fees', subHeading: ''),
                  const SizedBox(
                    height: 20,
                  ),
                  drawerGeneralTile(
                      heading: 'Support & Contact', subHeading: ''),
                  const SizedBox(
                    height: 50,
                  ),
                  drawerGeneralTile(
                    heading: 'Sign Out',
                    subHeading: '',
                    textcolor: AppColor.red,
                    isActiveArrow: false,
                    callback: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            content: Container(
                              height: 150,
                              width: SizeConfig.screenWidth / 1.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.strokeGrey,
                              ),
                              child: Column(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceEvenly,
                                children: [
                                  Spacer(flex: 2),
                                  CustomText(
                                    title: "Are you sure",
                                    color: AppColor.white,
                                    size: SizeConfig.screenWidth * 0.042,
                                    fontWeight: FontWeights.bold,
                                  ),
                                  Spacer(),
                                  CustomText(
                                    title: "You want to sign out?",
                                    color: AppColor.white,
                                    size: SizeConfig.screenWidth * 0.035,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Spacer(flex: 2),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      PrimaryBTN(
                                        callback: () {
                                          Navigator.pop(context);
                                        },
                                        width: SizeConfig.screenWidth / 3,
                                        textCLR: AppColor.primaryColor,
                                        color: AppColor.white,
                                        height: 45,
                                        title: 'Cancel',
                                        borderRadius: 12,
                                        fontWeight: FontWeights.extraBold,
                                      ),
                                      PrimaryBTN(
                                        callback: () {
                                          DatabaseHandler().logOut();
                                          Get.offAllNamed(AppRoutes.optionView);
                                        },
                                        width: SizeConfig.screenWidth / 3,
                                        textCLR: AppColor.primaryColor,
                                        color: AppColor.white,
                                        height: 45,
                                        title: 'Sign out',
                                        borderRadius: 12,
                                        fontWeight: FontWeights.extraBold,
                                      ),
                                    ],
                                  ),
                                  Spacer(flex: 2),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                      // DatabaseHandler().logOut();
                      // Get.offAllNamed(AppRoutes.optionView);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColor.greyText),
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Image(
                          image: AssetImage("assets/icons/cancel.png"),
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
