import 'dart:async';

import 'package:ats_customer/cubit/auth_cubit.dart';
import 'package:ats_customer/cubit/timer_cubit.dart';
import 'package:ats_customer/models/otp_model.dart';
import 'package:ats_customer/shared/shared_prefrences.dart';
import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/logo_horizontal.dart';
import 'package:ats_customer/ui/widgets/otp_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String name = '';
  String idCustomer = '';
  String phone = '';
  String password = '';
  String otp = '';

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, 'loading-regist', (route) => false);
      context.read<AuthCubit>().registUser(
          name: name,
          idCustomer: idCustomer,
          phone: phone,
          password: password,
          otp: otp);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<TimerCubit>().startTimer();

    final TextEditingController fieldOtp1Controller =
        TextEditingController(text: '');
    final TextEditingController fieldOtp2Controller =
        TextEditingController(text: '');
    final TextEditingController fieldOtp3Controller =
        TextEditingController(text: '');
    final TextEditingController fieldOtp4Controller =
        TextEditingController(text: '');

    Widget verifikasiOtp() {
      return Text(
        'Verifikasi OTP',
        style:
            blackTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
      );
    }

    Widget kamiTelah() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Kami telah mengirimkan kode verifikasi',
            style: secondGreyTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ke nomor ${phone} | ',
                style: secondGreyTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
              BlocBuilder<TimerCubit, int>(
                builder: (context, state) {
                  return Text(
                    '$state Detik',
                    style: secondGreyTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  );
                },
              )
            ],
          )
        ],
      );
    }

    Widget gantiNomor() {
      return Text(
        'Ganti nomor',
        style: primaryTextStyle.copyWith(
            fontSize: 16, fontWeight: FontWeight.w600),
      );
    }

    Widget otpFieldRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OtpField(
            hint: '',
            controller: fieldOtp1Controller,
          ),
          SizedBox(
            width: 8,
          ),
          OtpField(
            hint: '',
            controller: fieldOtp2Controller,
          ),
          SizedBox(
            width: 8,
          ),
          OtpField(
            hint: '',
            controller: fieldOtp3Controller,
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
                child: TextField(
                    controller: fieldOtp4Controller,
                    onChanged: (value) {
                      if (value.length == 1) {
                        // Navigator.pushNamed(context, 'loading-login');

                        context.read<AuthCubit>().registUser(
                            name: name,
                            idCustomer: idCustomer,
                            phone: phone,
                            password: password,
                            otp: otp);
                      }
                    },
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    showCursor: true,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "",
                        counterText: "")),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                height: 4,
                width: 40,
                color: kFieldOtpColor,
              ),
            ],
          ),
          SizedBox(
            width: 8,
          ),
        ],
      );
    }

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is GetOtpSuccess) {
            String otpCode = state.otpModel.data.otp.toString();

            var box1, box2, box3, box4;
            final runesOtp = otpCode.runes.toList();
            box1 = String.fromCharCode(runesOtp[0]);
            box2 = String.fromCharCode(runesOtp[1]);
            box3 = String.fromCharCode(runesOtp[2]);
            box4 = String.fromCharCode(runesOtp[3]);

            fieldOtp1Controller.text = box1;
            fieldOtp2Controller.text = box2;
            fieldOtp3Controller.text = box3;
            fieldOtp4Controller.text = box4;

            print(otpCode.toString());

            name = SharedPreference.registUser.getString("name");
            idCustomer = SharedPreference.registUser.getString("idCustomer");
            password = SharedPreference.registUser.getString("password");
            otp = otpCode;
            phone = state.otpModel.data.phone;
          }

          return Scaffold(
            body: ListView(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 72,
                    ),
                    Image.asset(
                      "assets/logo_new.png",
                      height: 40,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    verifikasiOtp(),
                    const SizedBox(
                      height: 8,
                    ),
                    kamiTelah(),
                    const SizedBox(
                      height: 8,
                    ),
                    gantiNomor(),
                    const SizedBox(
                      height: 44,
                    ),
                    otpFieldRow(),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, 'loading-login');
                      },
                      child: Text(
                        'Kirim ulang kode',
                        style: primaryTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
