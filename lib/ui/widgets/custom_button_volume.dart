import 'package:ats_customer/cubit/button_volume_selected_cubit.dart';
import 'package:ats_customer/shared/shared_prefrences.dart';
import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonVolume extends StatelessWidget {
  final String text;
  final int index;
  final String volume;

  const CustomButtonVolume({
    Key? key,
    required this.text,
    required this.index,
    required this.volume,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 10;

    return GestureDetector(
        onTap: () {
          context
              .read<ButtonVolumeSelectedCubit>()
              .setButtonVolume(volume: volume, index: index);
        },
        child:
            BlocConsumer<ButtonVolumeSelectedCubit, ButtonVolumeSelectedState>(
          listener: (context, state) {
            if (state is ButtonVolumeSelectedSuccess) {
              selectedIndex = state.index;
              SharedPreference.orderPO
                  ?.setString("button_volume", state.volume.toString());
            } else {
              selectedIndex = 10;
              SharedPreference.orderPO?.setString("button_volume", "lainnya");
            }
          },
          builder: (context, state) {
            return Container(
              width: 92,
              height: 48,
              margin: const EdgeInsets.only(right: 8, bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: selectedIndex == index
                          ? kPrimaryColor
                          : kFieldOtpColor),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Text(
                    text,
                    style: selectedIndex == index
                        ? blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500)
                        : secondGreyTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
