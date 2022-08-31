import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';

class CardBantuanItem extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const CardBantuanItem(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 12,
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            color: kSecondGreyColor,
            width: double.infinity,
            height: 1,
          )
        ],
      ),
    );
  }
}
