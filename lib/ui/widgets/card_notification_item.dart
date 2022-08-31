import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';

class CardNotificationitem extends StatelessWidget {
  final bool read;

  const CardNotificationitem({
    Key? key,
    required this.read,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: kFieldOtpColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Anda Telah Membuat DO",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Jam",
                    style: secondGreyTextStyle.copyWith(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Text(
                "Detail",
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        read
            ? const SizedBox()
            : Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/icon_new_notification.png",
                  height: 12,
                  width: 12,
                ),
              )
      ],
    );
  }
}
