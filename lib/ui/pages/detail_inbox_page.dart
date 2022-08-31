import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/card_inbox.dart';
import 'package:flutter/material.dart';

class DetailInboxPage extends StatelessWidget {
  const DetailInboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: kWhiteColor,
              padding: const EdgeInsets.only(top: 48, left: 16, bottom: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/icon_arrow_left.png",
                      height: 32,
                      width: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Chat Bantuan",
                    style: blackTextStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: kDividerColor,
              height: 1,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Status",
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: kGreenColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          "Close",
                          style: whiteTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        border: Border.all(color: kBackgroundLoadingBarColor),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              color: kHeaderCardActivityColor,
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(8))),
                          child: Text(
                            "No. pesanan 9232322123",
                            style: greyTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Kampiri Wajo",
                                      overflow: TextOverflow.ellipsis,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          "assets/icon_volume_dark.png",
                                          height: 24,
                                          width: 24,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "50 MT",
                                          overflow: TextOverflow.ellipsis,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/icon_person.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                      Text(
                                        "Sharika",
                                        style: greyTextStyle.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "12/12/2022",
                                    style: greyTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: kBackgroundLoadingBarColor)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Marketing belum memproses pesanan saya",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Saya memiliki masalah dibagian proses pemesanan yang sangat lama.",
                          style: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 160,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/img_inbox.png"))),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Jika anda mengalami masalah",
                      style: greyTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Hubungi Admin",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w700),
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
