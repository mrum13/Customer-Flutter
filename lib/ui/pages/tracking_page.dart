import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/card_tracking.dart';
import 'package:flutter/material.dart';
import 'package:steps_indicator/steps_indicator.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //NOTED : HEADER
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(
                    height: 48,
                  ),
                  Row(
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
                        "Lacak",
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/icon_track_accept.png",
                      height: 40,
                      width: 40,
                    ),
                    Text(
                      "Disetujui",
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const SizedBox(
                  width: 44,
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/icon_track_proccess_0.png",
                      height: 40,
                      width: 40,
                    ),
                    Text(
                      "Proses",
                      style: secondGreyTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const SizedBox(
                  width: 44,
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/icon_track_sending_0.png",
                      height: 40,
                      width: 40,
                    ),
                    Text(
                      "Dikirim",
                      style: secondGreyTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const SizedBox(
                  width: 44,
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/icon_track_finish_0.png",
                      height: 40,
                      width: 40,
                    ),
                    Text(
                      "Selesai",
                      style: secondGreyTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StepsIndicator(
                  selectedStep: 0,
                  lineLength: 72,
                  nbSteps: 4,
                  doneStepColor: Color(0xff003082),
                  doneStepWidget: Image.asset(
                    "assets/icon_track_check.png",
                    height: 16,
                    width: 16,
                  ),
                  undoneLineColor: kDividerColor,
                  unselectedStepColorIn: kDividerColor,
                  unselectedStepColorOut: kDarkGreyColor,
                  selectedStepColorOut: Color(0xff003082),
                  selectedStepWidget: Image.asset(
                    "assets/icon_track_check.png",
                    height: 16,
                    width: 16,
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 19,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       "Pesanan Selesai",
            //       style: primaryTextStyle.copyWith(
            //           fontSize: 12, fontWeight: FontWeight.w600),
            //     )
            //   ],
            // ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: double.infinity,
              height: 4,
              color: kBackgroundGreyColor,
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Status Pemesanan",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: StepsIndicator(
                            isHorizontal: false,
                            selectedStep: 1,
                            lineLength: 62,
                            nbSteps: 5,
                            doneStepColor: Color(0xff003082),
                            selectedStepSize: 8,
                            unselectedStepSize: 8,
                            doneStepSize: 8,
                            selectedStepColorIn: kStepperColor,
                            undoneLineColor: kStepperColor,
                            unselectedStepColorOut: kStepperColor,
                            unselectedStepColorIn: kStepperColor,
                            selectedStepColorOut: kStepperColor),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CardTracking(
                              title: "Pesanan sampai - Sabtu, 5 Mar 2022",
                              subtitle:
                                  "Pesanan telah sampai dan telah dikonfirmasi oleh pemesan (Sharika)",
                              date: "15:56 WITA",
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            CardTracking(
                              title: "Pesanan sampai - Sabtu, 5 Mar 2022",
                              subtitle:
                                  "Pesanan telah sampai dan telah dikonfirmasi oleh pemesan (Sharika)",
                              date: "15:56 WITA",
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            CardTracking(
                              title: "Pesanan sampai - Sabtu, 5 Mar 2022",
                              subtitle:
                                  "Pesanan telah sampai dan telah dikonfirmasi oleh pemesan (Sharika)",
                              date: "15:56 WITA",
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            CardTracking(
                              title: "Pesanan sampai - Sabtu, 5 Mar 2022",
                              subtitle:
                                  "Pesanan telah sampai dan telah dikonfirmasi oleh pemesan (Sharika)",
                              date: "15:56 WITA",
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            CardTracking(
                              title: "Pesanan sampai - Sabtu, 5 Mar 2022",
                              subtitle:
                                  "Pesanan telah sampai dan telah dikonfirmasi oleh pemesan (Sharika)",
                              date: "15:56 WITA",
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
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
