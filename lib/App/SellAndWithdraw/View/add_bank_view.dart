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

class AddBankView extends StatelessWidget {
  AddBankView({Key? key}) : super(key: key);
  bool _keyboardVisible = false;
  var addCardViewModel = AddCardViewModel();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Container(
      height: _keyboardVisible
          ? AppConfig(context).height
          : AppConfig(context).height / 1.1,
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
                title: "Add Your Bank Account",
                size: 18,
                fontWeight: FontWeights.bold,
                fontType: FontType.Onest,
                color: AppColor.white),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  PrimaryTextField(
                      isPass: false,
                      onChange: (value) {},
                      hintText: "Enter IBAN",
                      // prefixIcon: "assets/icons/person.png",
                      errorText: "Please Filled MM/YYYY",
                      width: AppConfig(context).width,
                      borderRadius: 10,
                      controller: TextEditingController(),
                      maxLine: 3,
                      headingText: "Recipient IBAN"),
                  PrimaryTextField(
                      isPass: false,
                      onChange: (value) {},
                      hintText: "Enter BIC / SWIFT",
                      // prefixIcon: "assets/icons/person.png",
                      errorText: "Please Filled MM/YYYY",
                      width: AppConfig(context).width,
                      borderRadius: 10,
                      controller: TextEditingController(),
                      maxLine: 3,
                      headingText: "BIC/SWIFT"),
                  PrimaryTextField(
                      isPass: false,
                      onChange: (value) {},
                      hintText: "First Name, Last Name",
                      // prefixIcon: "assets/icons/person.png",
                      errorText: "Please Filled MM/YYYY",
                      width: AppConfig(context).width,
                      borderRadius: 10,
                      controller: TextEditingController(),
                      maxLine: 3,
                      headingText: "Name"),
                  PrimaryTextField(
                      isPass: false,
                      onChange: (value) {},
                      hintText: "Street Name",
                      // prefixIcon: "assets/icons/person.png",
                      errorText: "Please Filled MM/YYYY",
                      width: AppConfig(context).width,
                      borderRadius: 10,
                      controller: TextEditingController(),
                      maxLine: 3,
                      headingText: "Address"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrimaryTextField(
                          isPass: false,
                          onChange: (value) {},
                          hintText: "Post Code",
                          // prefixIcon: "assets/icons/person.png",
                          errorText: "Please Filled MM/YYYY",
                          width: AppConfig(context).width / 2.3,
                          borderRadius: 10,
                          controller: TextEditingController(),
                          maxLine: 3,
                          headingText: ""),
                      PrimaryTextField(
                          isPass: false,
                          onChange: (value) {},
                          hintText: "City",
                          // prefixIcon: "assets/icons/person.png",
                          errorText: "Please Filled MM/YYYY",
                          width: AppConfig(context).width / 2.3,
                          borderRadius: 10,
                          controller: TextEditingController(),
                          maxLine: 3,
                          headingText: ""),
                    ],
                  ),
                  PrimaryTextField(
                      isPass: false,
                      onChange: (value) {},
                      hintText: "Country",
                      // prefixIcon: "assets/icons/person.png",
                      errorText: "Please Filled MM/YYYY",
                      width: AppConfig(context).width,
                      borderRadius: 10,
                      controller: TextEditingController(),
                      maxLine: 3,
                      headingText: ""),
                  const SizedBox(
                    height: 20,
                  ),
                  PrimaryBTN(
                    callback: () {
                      Navigator.pop(context);
                      // if (formKey.currentState!.validate()) {}
                    },
                    width: AppConfig(context).width,
                    textCLR: AppColor.primaryColor,
                    color: AppColor.white,
                    height: 60,
                    title: "Add Bank ",
                    borderRadius: 10,
                    fontWeight: FontWeights.extraBold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
