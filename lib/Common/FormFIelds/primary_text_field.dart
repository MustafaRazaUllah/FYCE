import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:biticonapp/Common/Constant/AppConfig.dart';
import 'package:biticonapp/Common/Constant/size_config.dart';
import 'package:biticonapp/Common/Theme/colors.dart';
import 'package:flutter/material.dart';

validatePassword(String value) {
  if (!(value.length > 5) && value.isNotEmpty) {
    return "Password should contain more than 5 characters";
  }
  return null;
}

class PrimaryTextField extends StatefulWidget {
  final bool isPass;

  final bool isEmail;
  final bool isPadding;
  final bool isPhone;
  final String hintText;
  final String headingText;
  final String? errorText;
  final double width;
  final bool isUploadBTN;
  final String prefixIcon;
  bool isName;
  bool readOnly;
  bool isOptional;
  int maxLine;
  VoidCallback? callback;
  String sufixIcon;
  Color sufixIconColor;
  bool isTextPrifix;
  double borderRadius;
  bool isSimpleValidation;
  int maxLength;
  String numberText;
  final Function(String value) onChange;
  final Function? prifixCallback;
  final TextEditingController controller;
  final TextInputType keyBoardType;

  PrimaryTextField(
      {Key? key,
      required this.isPass,
      required this.onChange,
      this.prifixCallback,
      this.isUploadBTN = false,
      this.isPadding = true,
      this.keyBoardType = TextInputType.text,
      this.isPhone = false,
      this.isEmail = false,
      this.readOnly = false,
      this.isOptional = false,
      this.isName = false,
      this.sufixIcon = "",
      this.isSimpleValidation = true,
      this.prefixIcon = "",
      this.isTextPrifix = false,
      required this.hintText,
      this.errorText,
      required this.width,
      required this.controller,
      this.callback,
      this.maxLength = 100,
      required this.headingText,
      this.borderRadius = 10,
      this.numberText = "",
      this.sufixIconColor = AppColor.white,
      this.maxLine = 1})
      : super(key: key);

  @override
  _PrimaryTextFieldState createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
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
                  size: SizeConfig.screenWidth * 0.035,
                ),
          widget.headingText.isEmpty
              ? const SizedBox.shrink()
              : SizedBox(
                  height: SizeConfig.screenWidth * 0.02,
                ),
          TextFormField(
            readOnly: widget.readOnly,
            controller: widget.controller,
            obscureText: _showPassword,
            maxLength: widget.maxLength,
            keyboardType: widget.keyBoardType,
            focusNode: widget.readOnly ? AlwaysDisabledFocusNode() : focusNode,
            cursorColor: AppColor.white,
            style: TextStyle(
              color: Colors.grey,
              fontSize: SizeConfig.screenWidth * 0.037,
              fontFamily: "Poppins",
            ),
            maxLines: widget.maxLine,
            validator: (value) {
              if (widget.isPass) {
                // if (value == null || value.isEmpty) {
                //   return "Please Enter ${widget.headingText}";
                // } else if (value.length < 6) {
                //   return widget.errorText;
                // }
                if (widget.isSimpleValidation) {
                  if (value == null || value.isEmpty) {
                    return widget.errorText ??
                        "Please enter ${widget.headingText.toLowerCase()}";
                  } else {
                    String pattern =
                        r"^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$";
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return '1 Uppercase letter, 1 special character and 1 number,\nminimum 8 characters is Required';
                    }
                  }
                } else {
                  if (value == null || value.isEmpty) {
                    return widget.errorText ??
                        "Please enter ${widget.headingText.toLowerCase()}";
                  }
                }
              } else if (widget.isEmail) {
                if (value == null || value.isEmpty) {
                  return widget.errorText ??
                      "Please enter ${widget.headingText.toLowerCase()}";
                } else if (!RegExp(
                        r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
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
            decoration: widget.prefixIcon.isNotEmpty
                ? InputDecoration(
                    isCollapsed: true,
                    counter: Offstage(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide:
                          BorderSide(color: AppColor.greyText.withOpacity(0.2)),
                    ),
                    prefixIcon: widget.prefixIcon.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              if (widget.prifixCallback != null) {
                                widget.prifixCallback!();
                              }
                            },
                            child: widget.isTextPrifix
                                ? Container(
                                    width: 65,
                                    decoration: BoxDecoration(
                                      color: AppColor.greyText.withOpacity(0.0),
                                      // color: AppColor.green,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            widget.borderRadius),
                                        bottomLeft: Radius.circular(
                                            widget.borderRadius),
                                      ),
                                    ),
                                    child: Center(
                                      child: CustomText(
                                        title: widget.prefixIcon,
                                        color: AppColor.white,
                                      ),
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      color: AppColor.greyText.withOpacity(0.0),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            widget.borderRadius),
                                        bottomLeft: Radius.circular(
                                            widget.borderRadius),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Image(
                                        height: 25,
                                        width: 25,
                                        color: widget.sufixIconColor,
                                        image: AssetImage(
                                          widget.prefixIcon,
                                        ),
                                      ),
                                    ),
                                  ),
                          )
                        : const SizedBox(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide:
                          BorderSide(color: AppColor.greyText.withOpacity(0.2)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide:
                          BorderSide(color: AppColor.greyText.withOpacity(0.2)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: const BorderSide(color: AppColor.red),
                    ),
                    suffixIcon: widget.isPass
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                // focusNode.unfocus();
                                // focusNode.canRequestFocus = false;
                                _showPassword = !_showPassword;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 20,
                                left: 10,
                                bottom: 5,
                                top: 5,
                              ),
                              child: Image(
                                height: 10,
                                width: 20,
                                color: AppColor.white,
                                image: !_showPassword
                                    ? const AssetImage("assets/icons/view.png")
                                    : const AssetImage(
                                        "assets/icons/hidden.png"),
                              ),
                            ))
                        : widget.sufixIcon.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image(
                                  height: 10,
                                  width: 20,
                                  // color: AppColor.greyText,
                                  image: AssetImage(widget.sufixIcon),
                                ),
                              )
                            : const SizedBox(),
                    filled: true,
                    hintStyle: const TextStyle(
                        color: AppColor.greyText,
                        fontSize: 14,
                        fontFamily: "Avenir"),
                    hintText: widget.hintText,
                    fillColor: AppColor.greyText.withOpacity(0.2),
                    contentPadding: widget.maxLine == 3
                        ? const EdgeInsets.only(left: 10, top: 30, bottom: 20)
                        : const EdgeInsets.only(left: 10, top: 22, bottom: 20))
                : widget.numberText.isNotEmpty
                    ? InputDecoration(
                        isCollapsed: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          // borderSide:
                          //     BorderSide(color: AppColor.greyText.withOpacity(0.5)),
                        ),
                        prefixIcon: widget.numberText.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, bottom: 30, left: 20),
                                child: CustomText(
                                  title: widget.numberText,
                                  color: AppColor.white,
                                ),
                              )
                            : const SizedBox(),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(color: AppColor.primaryColor),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(color: AppColor.primaryColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: const BorderSide(color: AppColor.red),
                        ),
                        errorMaxLines: 2,
                        suffixIcon: widget.isPass
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    focusNode.unfocus();
                                    focusNode.canRequestFocus = false;
                                    _showPassword = !_showPassword;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 10, bottom: 5, top: 5),
                                  child: Image(
                                    height: 10,
                                    width: 20,
                                    color: AppColor.white,
                                    image: _showPassword
                                        ? const AssetImage(
                                            "assets/icons/view.png")
                                        : const AssetImage(
                                            "assets/icons/hidden.png"),
                                  ),
                                ))
                            : widget.sufixIcon.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                      height: 10,
                                      width: 20,
                                      // color: AppColor.greyText,
                                      image: AssetImage(widget.sufixIcon),
                                    ),
                                  )
                                : const SizedBox(),
                        filled: true,
                        hintStyle: const TextStyle(
                            color: AppColor.greyText,
                            fontSize: 14,
                            fontFamily: "Avenir"),
                        hintText: widget.hintText,
                        fillColor: AppColor.greyText.withOpacity(0.2),
                        contentPadding:
                            const EdgeInsets.only(left: 10, top: 25, bottom: 0))
                    : InputDecoration(
                        isCollapsed: true,
                        counter: Offstage(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                              color: AppColor.greyText.withOpacity(0.2)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColor.greyText.withOpacity(0.2)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColor.greyText.withOpacity(0.2)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColor.red),
                        ),
                        suffixIcon: widget.isPass
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    focusNode.unfocus();
                                    focusNode.canRequestFocus = false;
                                    _showPassword = !_showPassword;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 10, bottom: 5, top: 5),
                                  child: Image(
                                    height: 10,
                                    width: 20,
                                    color: AppColor.greyText,
                                    image: _showPassword
                                        ? const AssetImage(
                                            "assets/icons/view.png")
                                        : const AssetImage(
                                            "assets/icons/hidden.png"),
                                  ),
                                ))
                            : widget.sufixIcon.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20,
                                        left: 20,
                                        bottom: 20,
                                        top: 20),
                                    child: Image(
                                      height: 20,
                                      width: 20,
                                      // color: AppColor.greyText,
                                      image: AssetImage(widget.sufixIcon),
                                    ),
                                  )
                                : const SizedBox(),
                        filled: true,
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: "Poppins"),
                        hintText: widget.hintText,
                        fillColor: AppColor.greyText.withOpacity(0.2),
                        contentPadding: widget.maxLine == 3
                            ? const EdgeInsets.only(
                                left: 30, top: 30, bottom: 0)
                            : const EdgeInsets.only(
                                left: 10, top: 20, bottom: 0)),
          ),
        ],
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
