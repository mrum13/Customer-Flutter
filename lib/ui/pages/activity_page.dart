import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/card_activity.dart';
import 'package:ats_customer/ui/widgets/custom_button_icon.dart';
import 'package:ats_customer/ui/widgets/custom_primary_button.dart';
import 'package:ats_customer/ui/widgets/custom_text_form_field_icon.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerSearch =
        TextEditingController(text: '');

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 48,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Riwayat',
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Aktifitas',
            style: blackTextStyle.copyWith(
                fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Pantau transaksi anda dengan mudah setiap saat',
            style: greyTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFormFieldIcon(
                    hintText: "Search",
                    cursorColor: kBlackColor,
                    controller: controllerSearch,
                    backgroundColor: kWhiteColor,
                    borderColor: kFieldOtpColor,
                    textInputType: TextInputType.text,
                    icon: "assets/icon_search.png",
                    textStyle: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400),
                    heightIcon: 24,
                    widthIcon: 24,
                    maxWidthIcon: 40,
                    maxHeightIcon: 40,
                    hintStyle: greyTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400)),
              ),
              const SizedBox(
                width: 8,
              ),
              CustomPrimaryButton(
                  width: 92, height: 40, title: "Search", onPressed: () {})
              // const SizedBox(
              //   width: 8,
              // ),
              // Container(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //       border: Border.all(color: kFieldOtpColor)),
              //   child: Row(
              //     children: [
              //       Image.asset(
              //         'assets/icon_filter.png',
              //         height: 16,
              //         width: 16,
              //       ),
              //       const SizedBox(
              //         width: 4,
              //       ),
              //       Text(
              //         'Filter',
              //         style: greyTextStyle.copyWith(
              //           fontSize: 12,
              //           fontWeight: FontWeight.w400,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   width: 8,
              // ),
              // Container(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //       border: Border.all(color: kFieldOtpColor)),
              //   child: Row(
              //     children: [
              //       Image.asset(
              //         'assets/icon_sort.png',
              //         height: 16,
              //         width: 16,
              //       ),
              //       const SizedBox(
              //         width: 4,
              //       ),
              //       Text(
              //         'Sort',
              //         style: greyTextStyle.copyWith(
              //           fontSize: 12,
              //           fontWeight: FontWeight.w400,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Desember 2021",
            style: blackTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 13,
          ),
          CardActivity(
            onPressed: () {
              Navigator.pushNamed(context, 'detail-order');
            },
          )
        ],
      ),
    ));
  }
}
