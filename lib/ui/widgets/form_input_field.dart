import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String titleForm;
  final Color titleColor;
  final Color backgroundColor;
  final Color borderColor;
  final TextInputType textInputType;
  final bool obscureText;
  final TextStyle hintStyle;
  final TextStyle textStyle;
  final Function()? onTapEye;
  final bool eye;

  const FormInputField({
    Key? key,
    required this.hint,
    required this.controller,
    required this.titleForm,
    this.obscureText = false,
    this.titleColor = const Color(0xff121212),
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.borderColor = const Color(0xffE0E0E0),
    this.textInputType = TextInputType.text,
    required this.textStyle,
    required this.hintStyle,
    this.onTapEye,
    this.eye = false,
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
                  fontSize: 16, color: titleColor, fontWeight: FontWeight.w700),
            ),
            Text(
              '*',
              style: redTextStyle,
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          eye: eye,
          textStyle: textStyle,
          hintStyle: hintStyle,
          obscureText: obscureText,
          maxLines: 1,
          textInputType: textInputType,
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          controller: controller,
          hintText: hint,
          onTapEye: onTapEye,
        )
      ],
    );
  }
}
