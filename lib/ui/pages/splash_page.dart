import 'package:ats_customer/shared/shared_prefrences.dart';
import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/logo_vertical.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {
          controller.value == 1.0
              ? Navigator.pushNamedAndRemoveUntil(
                  context, 'login', (route) => false)
              : null;
        });
      });
    controller.forward();
    super.initState();
    initializePreference();
  }

  Future<void> initializePreference() async {
    SharedPreference.registUser = await SharedPreferences.getInstance();
    SharedPreference.loginUser = await SharedPreferences.getInstance();
    SharedPreference.orderPO = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget logoText() {
      return Column(
        children: [
          Image.asset(
            "assets/logo_new.png",
            height: 40,
          ),
          Container(
            width: 128,
            height: 32,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/img_kalla_aspal.png'))),
          )
        ],
      );
    }

    Widget loadingBar() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 102),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          child: LinearProgressIndicator(
            value: controller.value,
            backgroundColor: kBackgroundLoadingBarColor,
            color: kPrimaryColor,
          ),
        ),
      );
    }

    Widget footer() {
      return Align(
        alignment: Alignment.center,
        child: Text('PT. BUMI SARANA UTAMA', style: textFooterloginStyle),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logoText(),
                  const SizedBox(
                    height: 55,
                  ),
                  loadingBar(),
                ],
              ),
            ),
            footer(),
            const SizedBox(
              height: 19,
            )
          ]),
        ),
      ),
    );
  }
}
