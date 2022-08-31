import 'dart:async';

import 'package:ats_customer/cubit/auth_cubit.dart';
import 'package:ats_customer/cubit/data_company_switch_cubit.dart';
import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingAddCompanyPage extends StatefulWidget {
  const LoadingAddCompanyPage({Key? key}) : super(key: key);

  @override
  State<LoadingAddCompanyPage> createState() => _LoadingAddCompanyPageState();
}

class _LoadingAddCompanyPageState extends State<LoadingAddCompanyPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      // Navigator.pushNamedAndRemoveUntil(context, 'main', (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String message = "Null";

    Widget contentLoading() {
      return Column(
        children: [
          Text(
            "Mengirim Data ke admin ATS...",
            style: whiteTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
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
      );
    }

    Widget contentSucces() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: Column(
          children: [
            Text(
              "Permintaan Berhasil dikirim, informasi selanjutnya akan dihubungi",
              textAlign: TextAlign.center,
              style: whiteTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'main', (route) => false);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    color: kSecondBlueColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    "Ya, Saya Paham",
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget contentFailed() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: Column(
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: whiteTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'main', (route) => false);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    color: kSecondBlueColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    "Ya, Saya Paham",
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

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
                height: 8,
              ),
              BlocBuilder<DataCompanySwitchCubit, DataCompanySwitchState>(
                builder: (context, state) {
                  if (state is AddDataCompanyLoading) {
                    return contentLoading();
                  }
                  if (state is AddDataCompanySuccess) {
                    return contentSucces();
                  }
                  if (state is AddDataCompanyFailed) {
                    message = state.error;
                    return contentFailed();
                  }
                  return Container();
                },
              )
            ],
          )),
        ],
      ),
    );
  }
}
