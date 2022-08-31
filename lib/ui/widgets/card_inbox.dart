import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CardInbox extends StatelessWidget {
  final String title,
      subtitle,
      volume,
      titleAnswer,
      titleCardAnswer,
      subtitleCardAnswer,
      volumeCardAnswer,
      contentAnswer,
      answer;

  const CardInbox(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.volume,
      required this.titleAnswer,
      required this.titleCardAnswer,
      required this.subtitleCardAnswer,
      required this.volumeCardAnswer,
      required this.contentAnswer,
      required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Marketing belum memproses pesanan saya",
            style: blackTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: kCardColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                      fontSize: 13, fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subtitle,
                      style: greyTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Lihat detail",
                      style: primaryTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/icon_volume_dark.png",
                      height: 16,
                      width: 16,
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Text(
                      volume,
                      style: greyTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icon_eye.png",
                height: 12,
                width: 12,
              ),
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16.0),
                        ),
                      ),
                      backgroundColor: kWhiteColor, // <-- SEE HERE
                      builder: (context) {
                        return Container(
                            padding: const EdgeInsets.only(
                                top: 8, left: 16, right: 16, bottom: 16),
                            child: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icon_dialog_bottom_sheet.png",
                                        height: 4,
                                        width: 32,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Text(
                                    titleAnswer,
                                    style: blackTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        color: kCardColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              titleCardAnswer,
                                              style: blackTextStyle.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              subtitleCardAnswer,
                                              style: greyTextStyle.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  "assets/icon_volume_dark.png",
                                                  height: 16,
                                                  width: 16,
                                                ),
                                                const SizedBox(
                                                  width: 1,
                                                ),
                                                Text(
                                                  volumeCardAnswer,
                                                  style: greyTextStyle.copyWith(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              ],
                                            ),
                                            Text(
                                              "Lihat detail",
                                              style: primaryTextStyle.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 21,
                                  ),
                                  Image.asset(
                                    "assets/img_inbox_example.png",
                                    height: 48,
                                    width: 48,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    contentAnswer,
                                    style: blackTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Jawaban :",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    answer,
                                    style: greyTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )
                                ])));
                      });
                },
                child: Text(
                  "Lihat Jawaban",
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
