import 'package:ats_customer/cubit/button_volume_cubit.dart';
import 'package:ats_customer/cubit/navbar_cubit.dart';
import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final String imageNavbar0;
  final String titleNavbar;
  final int index;
  final String imageNavbar1;

  const CustomBottomNavigationItem(
      {Key? key,
      required this.imageNavbar0,
      required this.titleNavbar,
      required this.index,
      required this.imageNavbar1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (index == 2) {
          context.read<ButtonVolumeCubit>().getDataVolume();
        }
        context.read<NavbarCubit>().setPage(index);
      },
      child: Container(
        width: 66,
        height: 56,
        // color: Colors.amber,
        // padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: context.read<NavbarCubit>().state == index
                          ? AssetImage(imageNavbar1)
                          : AssetImage(imageNavbar0))),
            ),
            Text(
              titleNavbar,
              style: context.read<NavbarCubit>().state == index
                  ? blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5)
                  : greyTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5),
            )
          ],
        ),
      ),
    );
  }
}
