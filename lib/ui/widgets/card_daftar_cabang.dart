import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';

class CardDaftarCabang extends StatelessWidget {
  final String title, subtitle, noHp;

  const CardDaftarCabang(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.noHp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kFieldOtpColor),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 1,
        //     blurRadius: 3,
        //     offset: const Offset(0, 3), // changes position of shadow
        //   ),
        // ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            subtitle,
            style: secondGreyTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/icon_phone.png",
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    noHp,
                    style: secondGreyTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Text(
                "Salin kontak",
                style: primaryTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w600),
              )
            ],
          )
        ],
      ),
    );
  }
}
