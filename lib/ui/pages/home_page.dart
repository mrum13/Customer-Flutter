import 'package:ats_customer/cubit/branch_cubit.dart';
import 'package:ats_customer/cubit/card_switch_company_cubit.dart';
import 'package:ats_customer/cubit/home_cubit.dart';
import 'package:ats_customer/models/branch_model.dart';
import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/background_home.dart';
import 'package:ats_customer/ui/widgets/card_cabang.dart';
import 'package:ats_customer/ui/widgets/card_news.dart';
import 'package:ats_customer/ui/widgets/card_switch_perusahaan.dart';
import 'package:ats_customer/ui/widgets/custom_button_icon.dart';
import 'package:ats_customer/ui/widgets/custom_primary_button.dart';
import 'package:ats_customer/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_text_form_field_icon.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controllerSearch =
      TextEditingController(text: '');

  TextEditingController totalHutangController =
      TextEditingController(text: 'Rp. 2.000.000.000');

  TextEditingController jatuhTempoController =
      TextEditingController(text: 'Rp. 2.000.000.000');

  bool hutangCondition = true;
  String kallaPoints = "0";
  String companyname = "kalla group";

  @override
  Widget build(BuildContext context) {
    Widget oldArAgeCard() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: kCardColor, borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon_callendar.png',
                    height: 32,
                    width: 32,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AR Age',
                        style: greyTextStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '0 Hari',
                        style: greyTextStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: kCardColor, borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon_dollar.png',
                    height: 32,
                    width: 32,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Piutang',
                        style: greyTextStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Rp. 0',
                        style: greyTextStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      );
    }

    Widget switchCompany() {
      return GestureDetector(
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
                    child: BlocBuilder<CardSwitchPerusahaanCubit, int>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              height: 32,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icon_dialog_switch_company.png",
                                  height: 94,
                                  width: 94,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            CardSwitchCompany(
                                status: false,
                                index: 0,
                                title: "PT. Tristar Sulawesi Mandiri",
                                subtitle: "Kota Makassar"),
                            const SizedBox(
                              height: 12,
                            ),
                            CardSwitchCompany(
                                status: false,
                                index: 1,
                                title: "PT. BAWAKARAENG LESTARI ",
                                subtitle: "Kota Makassar"),
                            const SizedBox(
                              height: 12,
                            ),
                            CardSwitchCompany(
                                status: false,
                                index: 2,
                                title: "PT. LOMPULLE",
                                subtitle: "Kota Makassar"),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              });
        },
        child: Text(
          'Ganti',
          style: primaryTextStyle.copyWith(
              fontSize: 12, fontWeight: FontWeight.w600),
        ),
      );
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          const BackgroundHome(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 40, left: 16, right: 16, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormFieldIcon(
                              cursorColor: kWhiteColor,
                              hintStyle: whiteTextStyle.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              maxHeightIcon: 40,
                              maxWidthIcon: 40,
                              heightIcon: 24,
                              widthIcon: 24,
                              textStyle: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              icon: 'assets/icon_search.png',
                              hintText: 'Search...',
                              controller: controllerSearch,
                              backgroundColor:
                                  const Color.fromRGBO(255, 255, 255, 0.2),
                              borderColor: kTransparentColor,
                              textInputType: TextInputType.text),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "notification");
                          },
                          child: Container(
                            height: 24,
                            width: 24,
                            margin: const EdgeInsets.only(right: 8, left: 16),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/icon_notifications.png'))),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Kalla points',
                      style: kallaPointsTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state is GetHomeDataSuccess) {
                          companyname = "${state.homeModel.data.name}";
                          kallaPoints = "${state.homeModel.data.point}";
                          totalHutangController = TextEditingController(
                              text:
                                  "${state.homeModel.data.amountDueRemaining}");
                          jatuhTempoController = TextEditingController(
                              text: "${state.homeModel.data.pastDueDays}");
                        }
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  kallaPoints,
                                  style: whiteTextStyle.copyWith(
                                      letterSpacing: 0.5,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Image.asset(
                                  'assets/icon_arrow_right.png',
                                  width: 32,
                                  height: 32,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                        bottom: 16,
                                        top: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          companyname,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: kCardColor,
                                              border: Border.all(
                                                  color:
                                                      kBackgroundLoadingBarColor),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Total Hutang",
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              TextField(
                                                obscureText: hutangCondition,
                                                controller:
                                                    totalHutangController,
                                                decoration:
                                                    const InputDecoration
                                                            .collapsed(
                                                        hintText:
                                                            'total hutang'),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: kCardColor,
                                              border: Border.all(
                                                  color:
                                                      kBackgroundLoadingBarColor),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Total Hutang Jatuh Tempo",
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              TextField(
                                                obscureText: hutangCondition,
                                                controller:
                                                    jatuhTempoController,
                                                decoration:
                                                    const InputDecoration
                                                            .collapsed(
                                                        hintText:
                                                            'total hutang'),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              hutangCondition =
                                                  !hutangCondition;
                                            });
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 11),
                                            decoration: BoxDecoration(
                                              color: kWhiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/icon_eye.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  "Lihat Nominal",
                                                  style:
                                                      primaryTextStyle.copyWith(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      color: kWhiteColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Aktifitas Order',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Pantau transaksi anda dengan MUDAH setiap saat',
                                  style: secondGreyTextStyle.copyWith(
                                      // overflow: TextOverflow.ellipsis,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/icon_arrow_right.png',
                            color: kGreyColor,
                            width: 32,
                            height: 32,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                          color: kCardColor2,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icon_not_activity_yet.png',
                            width: 58,
                            height: 58,
                          ),
                          Text(
                            'Belum ada aktifitas',
                            style: blackTextStyle.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButtonIcon(title: "Buat DO", onPressed: () {}),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
              Container(height: 4, color: kDividerColor),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "branch-list");
                  },
                  child: Container(
                    color: kWhiteColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cabang PT. BSU',
                                style: blackTextStyle.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Ketahui cabang-cabang PT. Bumi Sarana Utama',
                                style: secondGreyTextStyle.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/icon_arrow_right.png',
                          width: 32,
                          height: 32,
                          color: kGreyColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<BranchCubit, BranchState>(
                builder: (context, state) {
                  int branchLength = 0;

                  if (state is GetBranchDataSuccess) {
                    branchLength = branchLength;

                    return SizedBox(
                      height: 114,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                const SizedBox(
                                  width: 16,
                                ),
                                CardCabang(
                                    subtitle: state.branchModel[index].address,
                                    title: state.branchModel[index].name),
                              ],
                            );
                          }),
                    );
                  }
                  return const Center(
                    child: Text("Data Kosong"),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(height: 4, color: kDividerColor),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: kWhiteColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Berita Terkini',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Terus Update pengetahuan anda tentang berita terkini',
                                  style: secondGreyTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/icon_arrow_right.png',
                            color: kGreyColor,
                            width: 32,
                            height: 32,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Container(
                    //   width: double.infinity,
                    //   padding: const EdgeInsets.symmetric(vertical: 16),
                    //   decoration: BoxDecoration(
                    //       color: kCardColor2,
                    //       borderRadius: BorderRadius.circular(8)),
                    //   child: Column(
                    //     children: [
                    //       Image.asset(
                    //         'assets/icon_not_activity_yet.png',
                    //         width: 58,
                    //         height: 58,
                    //       ),
                    //       Text(
                    //         'Belum ada aktifitas',
                    //         style: blackTextStyle.copyWith(
                    //             fontSize: 12, fontWeight: FontWeight.w600),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    CardNews(),
                    const SizedBox(
                      height: 24,
                    ),
                    CardNews(),
                    const SizedBox(
                      height: 24,
                    ),
                    CardNews(),
                    const SizedBox(
                      height: 25,
                    )
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
