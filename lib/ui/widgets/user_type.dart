import 'package:ats_customer/cubit/user_type_cubit.dart';
import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserType extends StatelessWidget {
  final String title;
  final int index;
  const UserType({Key? key, required this.index, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<UserTypeCubit>().setType(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.read<UserTypeCubit>().state == index
                ? kWhiteColor
                : kFieldOtpColor),
        child: Center(
          child: Text(
            title,
            style: blackTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
