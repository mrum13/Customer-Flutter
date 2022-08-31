import 'package:ats_customer/cubit/card_switch_company_cubit.dart';
import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardSwitchCompany extends StatelessWidget {
  final String title, subtitle;
  final int index;
  final bool status;

  const CardSwitchCompany(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.status,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CardSwitchPerusahaanCubit>().setCardIndex(index);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          color: status ? kWhiteColor : kCardSwitchPerusahaanColor,
          border: Border.all(color: status ? kPrimaryColor : kFieldOtpColor),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(
                  fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              subtitle,
              style: greyTextStyle.copyWith(
                  fontSize: 12, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
