import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width, height;
  final EdgeInsets margin;
  final Function() onPressed;
  final Color backgroundColor;
  final TextStyle textStyle;
  final Color borderColor;

  const CustomButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.height = 48,
    required this.borderColor,
    required this.backgroundColor,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          side: BorderSide(color: borderColor),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Text(title, style: textStyle),
      ),
    );
  }
}
