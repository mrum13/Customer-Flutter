import 'package:ats_customer/cubit/tab_inbox_cubit.dart';
import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InboxTab extends StatelessWidget {
  final String title;
  final int index;
  final Color color;

  const InboxTab({
    Key? key,
    required this.title,
    required this.index,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int indexFromCubit = 0;

    return GestureDetector(
      onTap: () {
        context.read<TabInboxCubit>().setIndex(index);
      },
      child: BlocBuilder<TabInboxCubit, int>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  color: color,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 9.5),
                  child: Center(
                    child: Text(
                      title,
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  )),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                height: 2,
                color: context.read<TabInboxCubit>().state == index
                    ? kPrimaryColor
                    : kHeaderCardActivityColor,
              ),
            ],
          );
        },
      ),
    );
  }
}
