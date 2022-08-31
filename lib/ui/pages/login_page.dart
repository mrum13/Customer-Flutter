import 'package:ats_customer/cubit/auth_cubit.dart';
import 'package:ats_customer/cubit/branch_cubit.dart';
import 'package:ats_customer/cubit/home_cubit.dart';
import 'package:ats_customer/cubit/user_cubit.dart';
import 'package:ats_customer/shared/shared_prefrences.dart';
import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/background_auth.dart';
import 'package:ats_customer/ui/widgets/custom_primary_button.dart';
import 'package:ats_customer/ui/widgets/custom_text_form_field.dart';
import 'package:ats_customer/ui/widgets/form_input_field.dart';
import 'package:ats_customer/ui/widgets/logo_horizontal.dart';
import 'package:ats_customer/ui/widgets/subtitle_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  final TextEditingController phoneNoController =
      TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool eyeCondition = true;

  openwhatsapp() async {
    var whatsapp = "+6285256443534";
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=halo";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (await canLaunch(whatsappURl_android)) {
      await launch(whatsappURl_android);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonLogin() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginUserFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.error.toString())));
          } else if (state is LoginUserSuccess) {
            context.read<UserCubit>().getUser(id: state.userLoginModel.data.id);
            context.read<HomeCubit>().getHomeData();
            context.read<BranchCubit>().getBranchData();
            Navigator.pushNamedAndRemoveUntil(
                context, 'loading-login', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is LoginUserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomPrimaryButton(
              title: 'Masuk',
              onPressed: () {
                if (phoneNoController.text == '' ||
                    passwordController.text == '') {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Mohon lengkapi No HP dan Password")));
                } else {
                  context.read<AuthCubit>().loginUser(
                      phoneNo: phoneNoController.text.toString(),
                      password: passwordController.text.toString());
                }
              });
        },
      );
    }

    Widget buatAkun() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Belum punya akun? ',
            style: secondGreyTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.w400),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'register');
            },
            child: Text(
              'Buat akun',
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
          )
        ],
      );
    }

    Widget formLogin() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            FormInputField(
                textStyle: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                hintStyle: greyTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w500),
                textInputType: TextInputType.phone,
                titleForm: 'Nomor Handphone',
                hint: 'Nomor Hp anda ...',
                controller: phoneNoController),
            const SizedBox(
              height: 16,
            ),
            FormInputField(
              textStyle: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              hintStyle: greyTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w500),
              obscureText: true,
              eye: eyeCondition,
              titleForm: 'Password',
              hint: 'Password anda ...',
              controller: passwordController,
              onTapEye: () {
                setState(() {
                  eyeCondition = !eyeCondition;
                });
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Checkbox(
                          value: isChecked,
                          activeColor: kWhiteColor,
                          checkColor: kBlackColor,
                          side: MaterialStateBorderSide.resolveWith(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return BorderSide(color: kBlackColor);
                            }
                            return BorderSide(
                                color:
                                    kBlackColor); // Defer to default value on the theme or widget.
                          }),
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          }),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Ingat Saya",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Text(
                  "Lupa Password?",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            buttonLogin(),
            const SizedBox(
              height: 24,
            ),
            buatAkun(),
          ],
        ),
      );
    }

    Widget terjadiMasalah() {
      return Column(
        children: [
          Text(
            'Terjadi masalah pada nomor hp anda ?',
            style: secondGreyTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              openwhatsapp();
            },
            child: Text(
              'Hubungi Admin',
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
          )
        ],
      );
    }

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const BackgroundAuth(),
              const SizedBox(
                height: 19,
              ),
              Image.asset(
                "assets/logo_new.png",
                height: 40,
              ),
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: SubtitleAuth(
                  title: 'Masuk Akun',
                  subtitle:
                      'Silahkan masuk menggunakan Nomor Handphone & Password Anda',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              formLogin(),
              const SizedBox(
                height: 42,
              ),
              terjadiMasalah(),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 41,
                width: 155,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img_kalla_aspal.png'))),
              ),
              const SizedBox(
                height: 21,
              )
            ],
          ),
        ),
      ),
    );
  }
}
