import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget convertTile({
  required String price,
  VoidCallback? onTap,
  required String sellPrice,
  required String recievePrice,
}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 9),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff8F8F8F), width: 1),
                borderRadius: BorderRadius.circular(4)),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                          title: 'Sell', color: AppColor.greyText, size: 12),
                      Row(
                        children: [
                          const Image(
                            image: AssetImage('assets/icons/navBar/wallet.png'),
                            height: 10.39,
                            width: 10,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          CustomText(
                            title: price,
                            color: AppColor.white,
                          ),
                          const CustomText(title: ' Max', color: Colors.brown),
                        ],
                      ),
                    ]),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Bitcoin.png',
                          fit: BoxFit.cover,
                          height: 30,
                          width: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: onTap,
                            child: Row(
                              children:const [
                                CustomText(
                                  title: 'BTC',
                                  size: 22,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                )
                              ],
                            )),
                      ],
                    ),
                    CustomText(
                      title: sellPrice,
                      size: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColor.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const CustomText(
                      color: AppColor.greyText,
                      title: "CHF 3'189.21",
                      size: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 9),
            // width: AppConfig(context).w,

            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff8F8F8F), width: 1),
                borderRadius: BorderRadius.circular(4)),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                          title: 'Receive', color: AppColor.greyText, size: 12),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/navBar/wallet.png',
                            height: 10.39,
                            width: 10,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          CustomText(
                            title: price,
                            color: AppColor.white,
                          ),
                        ],
                      ),
                    ]),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Bitcoin.png',
                          fit: BoxFit.cover,
                          height: 30,
                          width: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: onTap,
                            child: Row(
                              children:const [
                                 CustomText(
                                  title: 'ETH',
                                  size: 22,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.white,
                                ),
                                 SizedBox(
                                  width: 10,
                                ),
                                 Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                )
                              ],
                            )),

                      ],
                    ),
                    CustomText(
                        title: recievePrice,
                        size: 22,
                        color: AppColor.white,
                        fontWeight: FontWeight.w700),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const CustomText(
                        color: AppColor.greyText,
                        title: "CHF 3'189.21",
                        size: 12,
                        fontWeight: FontWeight.w400),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      const Image(
        image: AssetImage('assets/icons/converter.png'),
        height: 30,
      )
    ],
  );
}
