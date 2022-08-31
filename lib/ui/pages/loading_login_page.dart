import 'dart:async';

import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/logo_horizontal_white.dart';
import 'package:flutter/material.dart';

class LoadingLoginPage extends StatefulWidget {
  const LoadingLoginPage({Key? key}) : super(key: key);

  @override
  State<LoadingLoginPage> createState() => _LoadingLoginPageState();
}

class _LoadingLoginPageState extends State<LoadingLoginPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      Navigator.pushNamedAndRemoveUntil(context, 'main', (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: kPrimaryColor,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 202,
                    height: 193,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/img_background_loading_up.png'))),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 215,
                    width: 226,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/img_background_loading_down.png'))),
                  ),
                ],
              ),
            ],
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo_new_white.png",
                height: 40,
              ),
              const SizedBox(
                height: 9,
              ),
              SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  backgroundColor: kBlackColor,
                  color: kCyanColor,
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
