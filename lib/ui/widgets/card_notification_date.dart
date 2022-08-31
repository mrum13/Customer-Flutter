import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/card_notification_item.dart';
import 'package:flutter/material.dart';

class CardNotificationDate extends StatelessWidget {
  final bool read;
  final String date;

  const CardNotificationDate({Key? key, required this.read, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: secondGreyTextStyle.copyWith(
              fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        CardNotificationitem(
          read: read,
        ),
        const SizedBox(
          height: 8,
        ),
        CardNotificationitem(
          read: read,
        )
      ],
    );
  }
}
