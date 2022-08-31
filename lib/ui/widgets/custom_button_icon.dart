import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomButtonIcon extends StatelessWidget {
  final String title;
  final double width;
  final EdgeInsets margin;
  final Function() onPressed;
  final Color color;
  final String icon;

  const CustomButtonIcon(
      {Key? key,
      required this.title,
      this.width = double.infinity,
      required this.onPressed,
      this.margin = EdgeInsets.zero,
      this.color = const Color(0xff003082),
      this.icon = "assets/icon_plus.png"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: 48,
      child: ElevatedButton.icon(
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        icon: Image.asset(
          icon,
          height: 24,
          width: 24,
        ),
        label: Text(
          title,
          style: whiteTextStyle.copyWith(
              fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
      ),
    );
  }
}
