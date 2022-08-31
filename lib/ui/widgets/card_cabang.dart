import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';

class CardCabang extends StatelessWidget {
  final String title;
  final String subtitle;

  const CardCabang({
    Key? key,
    required this.subtitle,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kDividerColor),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: secondGreyTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
