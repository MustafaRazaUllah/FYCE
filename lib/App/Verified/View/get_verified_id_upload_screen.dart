import 'package:biticonapp/Common/AppBTN/primary_btn.dart';
import 'package:biticonapp/Common/FormFIelds/primary_text_field.dart';
import 'package:biticonapp/Common/FormFIelds/secondary_text_field.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:biticonapp/RoutesAndBindings/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/AppBar/primary_app_bar.dart';
import '../../../Common/Constant/AppConfig.dart';

class GetVerifiedIdUploadView extends StatelessWidget {
  const GetVerifiedIdUploadView({Key? key}) : super(key: key);

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
            SecondaryTextField(
              isPass: false,
              onChange: (value) {},
              hintText: "Upload",
              // prefixIcon: "assets/icons/person.png",
              errorText: "Please Filled MM/YYYY",
              width: AppConfig(context).width,
              borderRadius: 10,
              controller: TextEditingController(),
              headingText: "ID Front",
            ),
            const SizedBox(
              height: 10,
            ),
            SecondaryTextField(
              isPass: false,
              onChange: (value) {},
              hintText: "Upload",
              // prefixIcon: "assets/icons/person.png",
              errorText: "Please Filled MM/YYYY",
              width: AppConfig(context).width,
              borderRadius: 10,
              controller: TextEditingController(),
              headingText: "ID Back",
            ),
            const SizedBox(
              height: 10,
            ),
            SecondaryTextField(
              isPass: false,
              onChange: (value) {},
              hintText: "Upload",
              // prefixIcon: "assets/icons/person.png",
              errorText: "Please Filled MM/YYYY",
              width: AppConfig(context).width,
              borderRadius: 10,
              controller: TextEditingController(),
              headingText: "Utility Bill / Official Document / Residency Proof",
            ),
            Spacer(),
            PrimaryBTN(
              callback: () {
                // if (formKey.currentState!.validate()) {}
                Get.toNamed(
                  AppRoutes.processingScreen,
                  arguments: [
                    "Processing Payment...",
                    "varification pending",
                  ],
                );
              },
              width: AppConfig(context).width,
              textCLR: AppColor.primaryColor,
              color: AppColor.white,
              height: 60,
              title: "Next",
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
