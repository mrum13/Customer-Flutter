import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';

class BackgroundHome extends StatelessWidget {
  const BackgroundHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 256,
          color: kPrimaryColor,
        ),
      ],
    );
  }
}
