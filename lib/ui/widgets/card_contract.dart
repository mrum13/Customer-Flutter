import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';

class CardContract extends StatelessWidget {
  final String title;
  final String contractNo;
  final String remaining;
  final Function() ontap;

  const CardContract({
    Key? key,
    required this.title,
    required this.contractNo,
    required this.remaining,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kCardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              contractNo,
              style: greyTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Sisa : ${remaining} MT",
              style: greyTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
