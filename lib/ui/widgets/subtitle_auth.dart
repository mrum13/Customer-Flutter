import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';

class SubtitleAuth extends StatelessWidget {
  final String title;
  final String subtitle;

  const SubtitleAuth({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              subtitle,
              style: secondGreyTextStyle.copyWith(
                height: 1.5,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ],
    );
  }
}
