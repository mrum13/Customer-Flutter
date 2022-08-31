import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';

class LogoHorizontal extends StatelessWidget {
  const LogoHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 17,
          width: 25,
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/icon_logo.png'))),
        ),
        Text(
          'ASPHALT TRADE SYSTEM',
          style: textLogoStyle,
        )
      ],
    );
  }
}
