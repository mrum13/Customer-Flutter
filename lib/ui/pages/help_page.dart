import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/card_activity.dart';
import 'package:ats_customer/ui/widgets/card_bantuan_item.dart';
import 'package:ats_customer/ui/widgets/custom_primary_button.dart';
import 'package:ats_customer/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerDetailMasalah =
        TextEditingController(text: '');

    return Scaffold(
        backgroundColor: kDividerColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                color: kBackgroundGreyColor,
                width: double.infinity,
              ),
              Column(
                children: [
                  Container(
                    color: kWhiteColor,
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 48, bottom: 16),
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
                          "ATS Care",
                          style: blackTextStyle.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       "Isu Terkait",
                        //       style: blackTextStyle.copyWith(
                        //           fontSize: 12, fontWeight: FontWeight.w600),
                        //     ),
                        //     Text(
                        //       "Pilih Transaksi Lain",
                        //       style: primaryTextStyle.copyWith(
                        //           fontSize: 10, fontWeight: FontWeight.w700),
                        //     )
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 17,
                        // ),

                        // Container(
                        //   decoration: BoxDecoration(
                        //       color: kWhiteColor,
                        //       boxShadow: [
                        //         BoxShadow(
                        //           color: Colors.grey.withOpacity(0.5),
                        //           spreadRadius: 1,
                        //           blurRadius: 6,
                        //           offset: const Offset(
                        //               4, 8), // changes position of shadow
                        //         ),
                        //       ],
                        //       borderRadius: BorderRadius.circular(8)),
                        //   child: Column(
                        //     children: [
                        //       Container(
                        //         decoration: BoxDecoration(
                        //             color: kHeaderCardActivityColor,
                        //             borderRadius: const BorderRadius.only(
                        //                 topLeft: Radius.circular(8),
                        //                 topRight: Radius.circular(8))),
                        //         padding: const EdgeInsets.symmetric(
                        //             vertical: 8, horizontal: 16),
                        //         child: Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Text(
                        //               "No. pesanan 9232322123",
                        //               style: greyTextStyle.copyWith(
                        //                   fontSize: 12,
                        //                   fontWeight: FontWeight.w500),
                        //             ),
                        //             Text(
                        //               "Disubmit",
                        //               style: orangeTextStyle.copyWith(
                        //                   fontSize: 12,
                        //                   fontWeight: FontWeight.w500),
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //       const SizedBox(
                        //         height: 20,
                        //       ),
                        //       Padding(
                        //         padding:
                        //             const EdgeInsets.symmetric(horizontal: 16),
                        //         child: Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Text(
                        //               "Kampiri Wajo",
                        //               style: blackTextStyle.copyWith(
                        //                   fontSize: 13,
                        //                   fontWeight: FontWeight.w400),
                        //             ),
                        //             Row(
                        //               children: [
                        //                 Image.asset(
                        //                   "assets/icon_volume_dark.png",
                        //                   height: 16,
                        //                   width: 16,
                        //                 ),
                        //                 const SizedBox(
                        //                   width: 1,
                        //                 ),
                        //                 Text(
                        //                   "50 MT",
                        //                   style: blackTextStyle.copyWith(
                        //                       fontSize: 13,
                        //                       fontWeight: FontWeight.w400),
                        //                 )
                        //               ],
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //       const SizedBox(
                        //         height: 4,
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.only(
                        //             left: 16, right: 16, bottom: 20),
                        //         child: Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Row(
                        //               children: [
                        //                 Image.asset(
                        //                   "assets/icon_person.png",
                        //                   height: 16,
                        //                   width: 16,
                        //                 ),
                        //                 const SizedBox(
                        //                   width: 3,
                        //                 ),
                        //                 Text(
                        //                   "Sharika",
                        //                   style: blackTextStyle.copyWith(
                        //                       fontSize: 12,
                        //                       fontWeight: FontWeight.w400),
                        //                 )
                        //               ],
                        //             ),
                        //             Text(
                        //               "12/12/2022",
                        //               style: blackTextStyle.copyWith(
                        //                   fontSize: 12,
                        //                   fontWeight: FontWeight.w500),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        CardActivity(onPressed: () {})
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: kWhiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Apa masalah yang kamu hadapi?",
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CardBantuanItem(
                          onPressed: () {
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
                                        top: 8,
                                        left: 16,
                                        right: 16,
                                        bottom: 16),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                            "Marketing belum memproses pesanan saya",
                                            style: blackTextStyle.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 1,
                                            color: kGreyColor,
                                          ),
                                          const SizedBox(
                                            height: 24,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Ceritakan masalahmu disini',
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                '*',
                                                style: redTextStyle,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          CustomTextFormField(
                                              textStyle:
                                                  blackTextStyle.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              hintStyle: greyTextStyle.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                              obscureText: false,
                                              hintText: "Detail masalah...",
                                              controller:
                                                  controllerDetailMasalah,
                                              backgroundColor: kWhiteColor,
                                              borderColor: kFieldOtpColor,
                                              textInputType: TextInputType.text,
                                              maxLines: 5),
                                          // const SizedBox(
                                          //   height: 4,
                                          // ),
                                          // Text(
                                          //   "Min. 30 karakter",
                                          //   style: greyTextStyle.copyWith(
                                          //       fontSize: 12,
                                          //       fontWeight: FontWeight.w400),
                                          // ),
                                          const SizedBox(
                                            height: 24,
                                          ),
                                          Text(
                                            "Lampiran",
                                            style: blackTextStyle.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "Lampirkan bukti pembayaran atau bukti pendukung lainnya agar kami paham masalahmu",
                                            style: secondGreyTextStyle.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            height: 64,
                                            width: 64,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: kFieldOtpColor),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            padding: const EdgeInsets.all(6),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xfff5f5f5),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Center(
                                                child: Image.asset(
                                                  "assets/icon_add_photo.png",
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "Format foto .JPG .Jpeg dan .PNG",
                                            style: secondGreyTextStyle.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            "Ukursan maks. 10 MB",
                                            style: secondGreyTextStyle.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const SizedBox(
                                            height: 24,
                                          ),
                                          CustomPrimaryButton(
                                              title: "Kirim",
                                              onPressed: () {
                                                Navigator.pop(context);
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return Dialog(
                                                        insetPadding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16)),
                                                        child: Container(
                                                          height: 272,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/icon_dialog_close.png',
                                                                      height:
                                                                          24,
                                                                      width: 24,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Image.asset(
                                                                'assets/icon_dialog_check.png',
                                                                height: 94,
                                                                width: 94,
                                                              ),
                                                              const SizedBox(
                                                                height: 16,
                                                              ),
                                                              Text(
                                                                'Berhasil',
                                                                style: blackTextStyle.copyWith(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              const SizedBox(
                                                                height: 4,
                                                              ),
                                                              Text(
                                                                'Permintaan anda akan segera kami proses, mohon bersabar',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: greyTextStyle.copyWith(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              const SizedBox(
                                                                height: 12,
                                                              ),
                                                              CustomPrimaryButton(
                                                                  title:
                                                                      "Cek inbox",
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  }),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              }),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          title: "Marketing belum memproses pesanan saya",
                        ),
                        CardBantuanItem(
                          onPressed: () {},
                          title:
                              "Bagaimana jika barang sudah diterima namun produk memiliki kelainan",
                        ),
                        CardBantuanItem(
                          onPressed: () {},
                          title: "Produk yang saya terima rusak",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
