import 'package:flutter/material.dart';

class BackgroundOrder extends StatelessWidget {
  const BackgroundOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 288,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/img_background_order_1.png"))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 48),
              height: 104,
              width: 94,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                'assets/img_background_order_2.png',
              ))),
            ),
          ],
        )
      ],
    );
  }
}
