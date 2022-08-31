import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  const OtpField({
    Key? key,
    required this.hint,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 40,
          child: TextField(
              controller: controller,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              showCursor: true,
              textAlign: TextAlign.center,
              maxLines: 1,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: hint, counterText: "")),
        ),
        const SizedBox(
          height: 1,
        ),
        Container(
          height: 4,
          width: 40,
          color: kFieldOtpColor,
        ),
      ],
    );
  }
}
