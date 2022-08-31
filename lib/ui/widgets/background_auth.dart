import 'package:flutter/material.dart';

class BackgroundAuth extends StatelessWidget {
  const BackgroundAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 149,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/img_background_1.png'))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 85,
              width: 94,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img_background_2.png'))),
            )
          ],
        )
      ],
    );
  }
}
