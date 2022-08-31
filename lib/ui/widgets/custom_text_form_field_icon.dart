import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldIcon extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Color backgroundColor;
  final Color borderColor;
  final TextInputType textInputType;
  final String icon;
  final TextStyle textStyle;
  final double heightIcon;
  final double widthIcon;
  final double maxWidthIcon;
  final double maxHeightIcon;
  final TextStyle hintStyle;
  final Color cursorColor;

  const CustomTextFormFieldIcon(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.backgroundColor,
      required this.borderColor,
      required this.textInputType,
      required this.icon,
      required this.textStyle,
      required this.heightIcon,
      required this.widthIcon,
      required this.maxWidthIcon,
      required this.maxHeightIcon,
      required this.cursorColor,
      required this.hintStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      style: textStyle,
      cursorColor: cursorColor,
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
          filled: true,
          prefixIconConstraints:
              BoxConstraints(maxWidth: maxWidthIcon, maxHeight: maxHeightIcon),
          prefixIcon: IconButton(
              icon: Image.asset(
                icon,
                width: widthIcon,
                height: heightIcon,
              ),
              onPressed: () {}),
          fillColor: backgroundColor,
          isDense: true,
          contentPadding: EdgeInsets.zero,
          hintText: hintText,
          hintStyle: hintStyle,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: kPrimaryColor))),
    );
  }
}
