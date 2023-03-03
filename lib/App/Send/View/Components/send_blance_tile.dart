import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget sendBalanceTile(
    {required String walletPrice,
      required BuildContext context,
    required String price,
    required String converterPrice,
    String image = "assets/images/Bitcoin.png"}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 9),
    width: AppConfig(context).width,
    height: AppConfig(context).height/3.5,
    decoration: BoxDecoration(

        border: Border.all(color:AppColor.greyText, width: 1),
        borderRadius: BorderRadius.circular(4)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title: 'Send', color: AppColor.greyText, size: 12,fontType: FontType.Onest,fontWeight: FontWeights.regular,),
        const SizedBox(
          height: 9,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Image(

                image:AssetImage(image),
                fit: BoxFit.cover,
                height: 30,
                width: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              CustomText(title: 'BTC', size: 22, fontWeight: FontWeights.bold,color: AppColor.white,fontType: FontType.Onest,),
            ],
          ),
          Row(
            children: [
              const Image(

                image:AssetImage('assets/icons/navBar/wallet.png'),
                height: 10.39,
                width: 10,
              ),
              const SizedBox(
                width: 7,
              ),
              CustomText(title: walletPrice,fontWeight: FontWeights.regular,color: AppColor.white,fontType: FontType.Onest,),
              CustomText(title: ' Max', color: AppColor.orange,fontWeight: FontWeights.regular,fontType: FontType.Onest,),
            ],
          ),
        ]),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
                color: AppColor.white,
                title: price,
                size: 36,
                fontWeight: FontWeight.w700),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: const [
                SizedBox(
                  height: 6,
                ),
                CustomText(
                    color: AppColor.white,
                    title: ' BTC',
                    size: 24,
                    fontWeight: FontWeights.bold),
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const  Image(

              image:AssetImage('assets/icons/converter.png'),
              height: 16,
              width: 16,
            ),
            const SizedBox(
              width: 6,
            ),
            CustomText(
                color: AppColor.greyText,
                title: converterPrice,
                size: 12,
                fontWeight: FontWeight.w400),
          ],
        ),
      ],
    ),
  );
}
