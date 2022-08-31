import 'dart:ffi';

import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/custom_button.dart';
import 'package:ats_customer/ui/widgets/custom_primary_button.dart';
import 'package:flutter/material.dart';

class DetailOrderPage extends StatelessWidget {
  const DetailOrderPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const bool finished = false;
    const bool ratingDone = false;

    Widget ratingContainer() {
      return Column(
        children: [
          //NOTED: RATING CONTAINER
          Container(
            padding: const EdgeInsets.only(top: 16, bottom: 24),
            decoration: BoxDecoration(
              color: kWhiteColor,
            ),
            child: Column(
              children: [
                Text(
                  "Kasih rating ke driver ?",
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "1 mengecewakan, 5 mantap!",
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'rating');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icon_star_0.png",
                        height: 32,
                        width: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        "assets/icon_star_0.png",
                        height: 32,
                        width: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        "assets/icon_star_0.png",
                        height: 32,
                        width: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        "assets/icon_star_0.png",
                        height: 32,
                        width: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        "assets/icon_star_0.png",
                        height: 32,
                        width: 32,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 1,
          ),
        ],
      );
    }

    Widget resultRatingContainer() {
      return Column(
        children: [
          Container(
              color: kWhiteColor,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icon_star_1.png",
                    height: 32,
                    width: 32,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Rating 3",
                    style: blackTextStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  )
                ],
              )),
          const SizedBox(
            height: 1,
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: kDividerColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //NOTED : HEADER
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
                    "Detail Pemesanan",
                    style: blackTextStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            // ignore: dead_code
            finished
                ? (ratingDone ? resultRatingContainer() : ratingContainer())
                : SizedBox(),
            Container(
              padding: const EdgeInsets.all(16),
              color: kWhiteColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Status",
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Tanggal Pemesanan",
                            style: secondGreyTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          finished
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: kGreenColor,
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Text(
                                    'Selesai',
                                    style: whiteTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: kOrangeColor,
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Text(
                                    'Disubmit',
                                    style: whiteTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "03 Maret 2021, 06:06 WITA",
                            style: secondGreyTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  finished
                      ? const SizedBox()
                      :
                      // ignore: dead_code
                      CustomButton(
                          height: 40,
                          title: "Lacak",
                          onPressed: () {
                            Navigator.pushNamed(context, "tracking");
                          },
                          borderColor: kPrimaryColor,
                          backgroundColor: kWhiteColor,
                          textStyle: primaryTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Container(
              color: kHeaderCardActivityColor,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Kampiri Wajo (PRE)",
                    style: blackTextStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Container(
              color: kWhiteColor,
              padding: const EdgeInsets.only(
                  top: 20, left: 16, right: 16, bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tentang pesanan",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icon_id_order.png",
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "No. Pesanan",
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Text(
                        "1234567890",
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icon_volume_light.png",
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Volume",
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Text(
                        "50 MT",
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icon_date_form.png",
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Tanggal rencana bongkar",
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Text(
                        "12/10/2021",
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icon_clock.png",
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Jam rencana bongkar",
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Text(
                        "20:00 WITA",
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Pemesan",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icon_account.png",
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Pemesan",
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Text(
                        "Sharika",
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
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
                            width: 4,
                          ),
                          Text(
                            "Kontak",
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Text(
                        "0822-12121-3323",
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icon_company.png",
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Perusahaan",
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Text(
                        "PT. Satu Dua Tiga",
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
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
                            width: 4,
                          ),
                          Text(
                            "Kontak perusahaan",
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Text(
                        "2323-2112-1212",
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Image.asset("assets/divider.png"),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Terjadi Masalah ?",
                    style: blackTextStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Kami siap membantu anda jika ada masalah pemesanan yang anda hadapi",
                    style: greyTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomPrimaryButton(
                      title: "Bantuan",
                      onPressed: () {
                        Navigator.pushNamed(context, 'help');
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
