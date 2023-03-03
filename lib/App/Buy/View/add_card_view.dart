import 'package:biticonapp/App/Buy/ViewModel/add_card_view_model.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:biticonapp/Common/custom_botttom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/AppBTN/primary_btn.dart';
import '../../../Common/AppText/AppTextView.dart';
import '../../../Common/Constant/AppConfig.dart';
import '../../../Common/FormFIelds/primary_text_field.dart';
import '../../../RoutesAndBindings/app_routes.dart';
import 'Components/crypto_listing_tile.dart';

class AddCardView extends StatelessWidget {
  AddCardView({Key? key}) : super(key: key);
  bool _keyboardVisible = false;
  var addCardViewModel = AddCardViewModel();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Container(
      height: _keyboardVisible
          ? AppConfig(context).height
          : AppConfig(context).height / 1.5,
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: AppColor.strokeGrey,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Form(
        key: formKey,
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
                title: "Add Your Card",
                size: 18,
                fontWeight: FontWeights.bold,
                fontType: FontType.Onest,
                color: AppColor.white),
            const SizedBox(
              height: 20,
            ),
            PrimaryTextField(
                isPass: false,
                onChange: (value) {},
                hintText: "Enter Cardholder Name",
                prefixIcon: "assets/icons/person.png",
                errorText: "Please Filled Cardholder Name",
                width: AppConfig(context).width,
                borderRadius: 0,
                controller: addCardViewModel.cardHolder,
                maxLine: 1,
                headingText: "Cardholder Name"),
            const SizedBox(
              height: 10,
            ),
            PrimaryTextField(
                isPass: false,
                onChange: (value) {},
                hintText: "Card Number",
                prefixIcon: "assets/icons/cardNo.png",
                sufixIcon: "assets/icons/visa.png",
                errorText: "Please Filled a Card Number",
                width: AppConfig(context).width,
                borderRadius: 0,
                controller: addCardViewModel.cardNumber,
                maxLine: 1,
                maxLength: 14,
                headingText: "Card Number"),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryTextField(
                    isPass: false,
                    onChange: (value) {},
                    hintText: "MM/YYYY",
                    // prefixIcon: "assets/icons/person.png",
                    errorText: "Please Filled MM/YYYY",
                    width: AppConfig(context).width / 2.4,
                    borderRadius: 10,
                    controller: addCardViewModel.expiryDate,
                    maxLine: 2,
                    maxLength: 7,
                    headingText: "Expiry date"),
                PrimaryTextField(
                    isPass: false,
                    onChange: (value) {},
                    hintText: "xxx",
                    // prefixIcon: "assets/icons/person.png",
                    errorText: "Please Filled 3-digit CVV",
                    width: AppConfig(context).width / 2.4,
                    borderRadius: 10,
                    controller: addCardViewModel.digitCcv,
                    maxLine: 1,
                    maxLength: 3,
                    headingText: "3-digit CVV"),
              ],
            ),
            const Spacer(),
            PrimaryBTN(
              callback: () {

                // if (formKey.currentState!.validate()) {}
                Get.toNamed(AppRoutes.buyPreview);
              },
              width: AppConfig(context).width,
              textCLR: AppColor.primaryColor,
              color: AppColor.white,
              height: 60,
              title: 'Add Card',
              borderRadius: 10,
              fontWeight: FontWeights.extraBold,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
