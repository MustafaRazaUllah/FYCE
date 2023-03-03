// ignore_for_file: must_be_immutable

import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';

class SecondaryTextField extends StatefulWidget {
  final bool isPass;
  final bool isEmail;
  final bool isPadding;
  final bool isPhone;
  final String hintText;
  final String headingText;
  final String errorText;
  final double width;
  bool isName;
  bool readOnly;
  bool isOptional;
  VoidCallback? callback;
  double borderRadius;
  String numberText;
  final Function(String value) onChange;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final bool isSuffix;

  SecondaryTextField({
    Key? key,
    required this.isPass,
    required this.onChange,
    this.isPadding = true,
    this.keyBoardType = TextInputType.text,
    this.isPhone = false,
    this.isEmail = false,
    this.readOnly = false,
    this.isOptional = false,
    this.isName = false,
    required this.hintText,
    required this.errorText,
    required this.width,
    required this.controller,
    this.callback,
    required this.headingText,
    this.borderRadius = 10,
    this.numberText = "",
    this.isSuffix = false,
  }) : super(key: key);

  @override
  _SecondaryTextFieldState createState() => _SecondaryTextFieldState();
}

class _SecondaryTextFieldState extends State<SecondaryTextField> {
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    if (widget.isPass) {
      _showPassword = true;
    }
  }

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.headingText.isEmpty
              ? const SizedBox.shrink()
              : CustomText(
                  title: widget.headingText,
                  color: AppColor.white,
                  alignment: TextAlign.center,
                  fontType: FontType.Onest,
                  fontWeight: FontWeights.regular,
                  size: 14),
          widget.headingText.isEmpty
              ? const SizedBox.shrink()
              : const SizedBox(
                  height: 10,
                ),
          TextFormField(
              readOnly: widget.readOnly,
              controller: widget.controller,
              obscureText: _showPassword,
              keyboardType: widget.keyBoardType,
              focusNode:
                  widget.readOnly ? AlwaysDisabledFocusNode() : focusNode,
              cursorColor: AppColor.white,
              style: const TextStyle(
                  color: Colors.grey, fontSize: 15, fontFamily: "Onest"),
              validator: (value) {
                if (widget.isEmail) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                          .hasMatch(value)) {
                    return "Please enter valid Email";
                  }
                } else if (widget.isPhone) {
                  if (value == null || value.isEmpty || value[0] != "+") {
                    return "Please enter valid mobile number";
                  }
                } else if (value == null || value.isEmpty) {
                  return widget.errorText;
                } else if (widget.isOptional && (value.isEmpty)) {
                  return null;
                }

                return null;
              },
              onChanged: (value) {
                widget.onChange(value);
              },
              onTap: widget.callback,
              decoration: widget.numberText.isNotEmpty
                  ? InputDecoration(
                      isCollapsed: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        borderSide:
                            const BorderSide(color: AppColor.strokeGrey),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                            top: 30, bottom: 30, left: 20),
                        child: CustomText(
                          title: widget.numberText,
                          color: AppColor.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        borderSide:
                            const BorderSide(color: AppColor.strokeGrey),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        borderSide:
                            const BorderSide(color: AppColor.strokeGrey),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        borderSide: const BorderSide(color: AppColor.red),
                      ),
                      filled: true,
                      hintStyle: const TextStyle(
                          color: AppColor.greyText,
                          fontSize: 14,
                          fontFamily: "Avenir"),
                      hintText: widget.hintText,
                      fillColor: AppColor.greyText.withOpacity(0.2),
                      contentPadding: const EdgeInsets.only(
                          left: 25, top: 20, bottom: 20, right: 0))
                  : InputDecoration(
                      isCollapsed: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        borderSide:
                            const BorderSide(color: AppColor.strokeGrey),
                      ),
                      suffixIcon: widget.isSuffix
                          ? const Padding(
                              padding: EdgeInsets.all(12),
                              child: Image(
                                height: 35,
                                width: 20,
                                // color: AppColor.greyText,
                                image: AssetImage("assets/icons/drop.png"),
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                height: 50,
                                width: 0,
                              ),
                            ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        borderSide:
                            const BorderSide(color: AppColor.strokeGrey),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        borderSide:
                            const BorderSide(color: AppColor.strokeGrey),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        borderSide: const BorderSide(color: AppColor.red),
                      ),
                      filled: true,
                      hintStyle: const TextStyle(
                          color: AppColor.greyText,
                          fontSize: 14,
                          fontFamily: "Avenir"),
                      hintText: widget.hintText,
                      fillColor: AppColor.greyText.withOpacity(0.2),
                      contentPadding: const EdgeInsets.only(
                          left: 25, top: 20, bottom: 20, right: 0))),
        ],
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
