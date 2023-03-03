import 'package:biticonapp/Common/AppBTN/primary_btn.dart';
import 'package:biticonapp/Common/AppBar/primary_app_bar.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';

import 'package:biticonapp/RoutesAndBindings/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/FormFIelds/secondary_text_field.dart';
import '../../../Common/Theme/colors.dart';

class GetVerifiedView extends StatelessWidget {
  const GetVerifiedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.strokeGrey,
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          children: [
            primaryAppBar(
              context: context,
              title: 'Get Verified',
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: [
                  SecondaryTextField(
                      isPass: false,
                      onChange: (value) {},
                      hintText: "Enter your First Name",
                      // prefixIcon: "assets/icons/person.png",
                      errorText: "Please Filled MM/YYYY",
                      width: AppConfig(context).width,
                      borderRadius: 10,
                      controller: TextEditingController(),
                      headingText: "First Name"),
                  const SizedBox(height: 10),
                  SecondaryTextField(
                      isPass: false,
                      onChange: (value) {},
                      hintText: "Enter your Last Name",
                      // prefixIcon: "assets/icons/person.png",
                      errorText: "Please Filled MM/YYYY",
                      width: AppConfig(context).width,
                      borderRadius: 10,
                      controller: TextEditingController(),
                      headingText: "Last Name"),
                  const SizedBox(height: 10),
                  SecondaryTextField(
                      isPass: false,
                      onChange: (value) {},
                      hintText: "DD/MM/YYYY",
                      // prefixIcon: "assets/icons/person.png",
                      errorText: "Please Filled MM/YYYY",
                      width: AppConfig(context).width,
                      borderRadius: 10,
                      controller: TextEditingController(),
                      keyBoardType: TextInputType.number,
                      headingText: "Date of Birth"),
                  const SizedBox(height: 10),
                  SecondaryTextField(
                      isPass: false,
                      onChange: (value) {},
                      hintText: "Street Name",
                      // prefixIcon: "assets/icons/person.png",
                      errorText: "Please Filled MM/YYYY",
                      width: AppConfig(context).width,
                      borderRadius: 10,
                      controller: TextEditingController(),
                      headingText: "Address"),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SecondaryTextField(
                        isPass: false,
                        onChange: (value) {},
                        hintText: "Post Code",
                        // prefixIcon: "assets/icons/person.png",
                        errorText: "Please Filled MM/YYYY",
                        width: AppConfig(context).width / 2.3,
                        borderRadius: 10,
                        keyBoardType: TextInputType.number,
                        controller: TextEditingController(),
                        headingText: "",
                      ),
                      SecondaryTextField(
                        isPass: false,
                        onChange: (value) {},
                        hintText: "City",
                        // prefixIcon: "assets/icons/person.png",
                        errorText: "Please Filled MM/YYYY",
                        width: AppConfig(context).width / 2.3,
                        borderRadius: 10,
                        controller: TextEditingController(),
                        headingText: "",
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SecondaryTextField(
                      isPass: false,
                      onChange: (value) {},
                      hintText: "Country",
                      // prefixIcon: "assets/icons/person.png",
                      errorText: "Please Filled MM/YYYY",
                      width: AppConfig(context).width,
                      borderRadius: 10,
                      isSuffix: true,
                      controller: TextEditingController(),
                      headingText: ""),
                  const SizedBox(height: 30),
                  PrimaryBTN(
                    callback: () {
                      // if (formKey.currentState!.validate()) {}
                      Get.toNamed(AppRoutes.getVerifiedIdUploadView);
                    },
                    width: AppConfig(context).width,
                    textCLR: AppColor.primaryColor,
                    color: AppColor.white,
                    height: 60,
                    title: "Next",
                    borderRadius: 10,
                    fontWeight: FontWeights.extraBold,
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
