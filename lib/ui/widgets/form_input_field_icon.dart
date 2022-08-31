import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/custom_text_form_field_icon.dart';
import 'package:flutter/material.dart';

class FormInputFieldIcon extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String titleForm;
  final Color titleColor;
  final Color backgroundColor;
  final Color borderColor;
  final Color cursorColor;
  final double heightIcon;
  final double widthIcon;
  final double maxHeightIcon;
  final double maxWidthIcon;
  final TextStyle hintStyle;
  final String icon;
  final TextStyle textStyle;
  final TextInputType textInputType;

  const FormInputFieldIcon({
    Key? key,
    required this.hint,
    required this.controller,
    required this.titleForm,
    required this.cursorColor,
    required this.heightIcon,
    required this.widthIcon,
    required this.maxHeightIcon,
    required this.maxWidthIcon,
    required this.hintStyle,
    required this.icon,
    required this.textStyle,
    this.titleColor = const Color(0xff121212),
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.borderColor = const Color(0xffE0E0E0),
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              titleForm,
              style: blackTextStyle.copyWith(
                  fontSize: 16, color: titleColor, fontWeight: FontWeight.bold),
            ),
            Text(
              '*',
              style: redTextStyle,
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        CustomTextFormFieldIcon(
          cursorColor: cursorColor,
          heightIcon: heightIcon,
          widthIcon: widthIcon,
          hintStyle: hintStyle,
          icon: icon,
          maxHeightIcon: maxHeightIcon,
          maxWidthIcon: maxWidthIcon,
          textStyle: textStyle,
          textInputType: textInputType,
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          controller: controller,
          hintText: hint,
        )
      ],
    );
  }
}
