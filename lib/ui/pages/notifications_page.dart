import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/card_notification_date.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Notifikasi",
                    style: blackTextStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CardNotificationDate(
                    read: false,
                    date: "Hari ini",
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CardNotificationDate(
                    read: true,
                    date: "Kemarin",
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CardNotificationDate(
                    read: true,
                    date: "9 Agustus 2022",
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 40, right: 16),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    "assets/icon_dialog_close.png",
                    height: 32,
                    width: 32,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
