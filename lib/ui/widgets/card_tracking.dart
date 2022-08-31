import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';

class CardTracking extends StatelessWidget {
  final String title, subtitle, date;

  const CardTracking(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 229,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                subtitle,
                style: greyTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Text(
          date,
          style: blackTextStyle.copyWith(
              fontSize: 14, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
