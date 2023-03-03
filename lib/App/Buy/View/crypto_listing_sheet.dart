import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/AppText/AppTextView.dart';
import '../../../Common/Constant/AppConfig.dart';
import '../../../RoutesAndBindings/app_routes.dart';
import 'Components/crypto_listing_tile.dart';

class CryptoListingSheet extends StatelessWidget {
  const CryptoListingSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConfig(context).height / 1.5,
      decoration:const  BoxDecoration(
        color: AppColor.strokeGrey,
        borderRadius:  BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 45,
            height: 7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: AppColor.greyText.withOpacity(0.5),
                      offset: const Offset(0, 7))
                ]),
          ),
          const SizedBox(
            height: 25,
          ),
          const CustomText(
              title: "Buy Cryptocurrency",
              size: 18,
              fontWeight: FontWeights.bold,
              fontType: FontType.Onest,
              color: AppColor.white),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
                itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                child: cryptoListingTile(callback: () {
                  Get.toNamed(AppRoutes.buyCrypto);
                }),
              );
            }),
          )
        ],
      ),
    );
  }
}
