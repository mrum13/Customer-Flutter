import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Color backgroundColor;
  final Color borderColor;
  final TextInputType textInputType;
  final int maxLines;
  final bool obscureText;
  final TextStyle hintStyle;
  final TextStyle textStyle;
  final Function()? onTapEye;
  final bool eye;

  const CustomTextFormField(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.backgroundColor,
      required this.borderColor,
      required this.textInputType,
      required this.maxLines,
      required this.obscureText,
      required this.hintStyle,
      required this.textStyle,
      this.onTapEye,
      this.eye = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: TextFormField(
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            obscureText: eye,
            maxLines: maxLines,
            style: textStyle,
            cursorColor: kBlackColor,
            controller: controller,
            keyboardType: textInputType,
            decoration: InputDecoration(
                filled: true,
                fillColor: backgroundColor,
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14.0),
                hintText: hintText,
                hintStyle: hintStyle,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: borderColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: kPrimaryColor))),
          ),
        ),
        obscureText
            ? Container(
                width: double.infinity,
                height: 48,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: onTapEye,
                      child: Container(
                        height: 20,
                        width: 20,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: eye
                                    ? AssetImage("assets/icon_pass.png")
                                    : AssetImage("assets/icon_pass_1.jpg"))),
                      )),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
