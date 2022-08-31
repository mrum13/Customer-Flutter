import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';

class CardInboxOngoing extends StatelessWidget {
  final String title;
  final String status;
  final String noPesanan;
  final String content;

  const CardInboxOngoing(
      {Key? key,
      required this.title,
      required this.status,
      required this.content,
      required this.noPesanan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "detail-inbox");
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kFieldOtpColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: kOrangeColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    status,
                    style: whiteTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "No. pesanan ${noPesanan}",
              style: greyTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              color: kHeaderCardActivityColor,
              child: Row(
                children: [
                  Image.asset(
                    "assets/icon_inbox_ongoing.png",
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      content,
                      overflow: TextOverflow.ellipsis,
                      style: blackTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
