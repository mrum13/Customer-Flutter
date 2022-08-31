import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';

class OtpNumpad extends StatelessWidget {
  const OtpNumpad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {},
              child: Text(
                '1',
                style: blackTextStyle.copyWith(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              '2',
              style: blackTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              '3',
              style: blackTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(
          height: 83,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '4',
              style: blackTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              '5',
              style: blackTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              '6',
              style: blackTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(
          height: 83,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '7',
              style: blackTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              '8',
              style: blackTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              '9',
              style: blackTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(
          height: 83,
        ),
        Text(
          '0',
          style: blackTextStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
