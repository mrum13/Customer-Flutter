import 'dart:convert';

import 'package:ats_customer/cubit/auth_cubit.dart';
import 'package:ats_customer/cubit/user_type_cubit.dart';
import 'package:ats_customer/models/company_auth_model.dart';
import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/background_auth.dart';
import 'package:ats_customer/ui/widgets/custom_primary_button.dart';
import 'package:ats_customer/ui/widgets/form_input_field.dart';
import 'package:ats_customer/ui/widgets/logo_horizontal.dart';
import 'package:ats_customer/ui/widgets/subtitle_auth.dart';
import 'package:ats_customer/ui/widgets/user_type.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/list_customer_auth_model.dart';

import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController fullnameController =
      TextEditingController(text: '');

  final TextEditingController phoneController = TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');

  final TextEditingController confirmPasswordController =
      TextEditingController(text: '');

  String selectedIdDropdown = "Null";

  String dropValueAmpTujuan = 'Makassar';

  bool eyeCondition = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocBuilder<UserTypeCubit, int>(
        builder: (context, state) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    const BackgroundAuth(),
                    Column(
                      children: [
                        const SizedBox(
                          height: 168,
                        ),
                        Image.asset(
                          "assets/logo_new.png",
                          height: 40,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Daftar Akun",
                          style: blackTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: kCardInfoColor,
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icon_info_register.png",
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  "Pastikan nomor handphone masih aktif dan belum pernah terdaftar",
                                  style: orangeTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 32),
                          child: Column(children: [
                            FormInputField(
                                textStyle: blackTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                hintStyle: greyTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                                textInputType: TextInputType.name,
                                hint: 'Nama lengkap ...',
                                controller: fullnameController,
                                titleForm: 'Nama Lengkap'),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Tipe User",
                                  style: blackTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '*',
                                  style: redTextStyle,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: kFieldOtpColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: kFieldOtpColor)),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: UserType(
                                          index: 0, title: "Perusahaan")),
                                  Expanded(
                                      child: UserType(
                                          index: 1, title: "Personal")),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Nama Perusahaan",
                                  style: blackTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '*',
                                  style: redTextStyle,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            AbsorbPointer(
                              absorbing: state == 0 ? false : true,
                              child: DropdownSearch<CompanyAuthModel>(
                                asyncItems: (text) async {
                                  var response = await http.get(Uri.parse(
                                      "http://103.142.111.167:10002/api/customeruser/listcustomer"));
                                  if (response.statusCode != 200) {
                                    return [];
                                  }
                                  List allCompany = (json.decode(response.body)
                                      as Map<String, dynamic>)["data"];
                                  List<CompanyAuthModel> allNameCompany = [];

                                  allCompany.forEach((element) {
                                    allNameCompany.add(CompanyAuthModel(
                                        id: element["id"],
                                        name: element["name"]));
                                  });
                                  return allNameCompany;
                                },
                                // popupProps: PopupProps.menu(
                                //   showSelectedItems: true,
                                //   disabledItemFn: (CompanyAuthModel s) => s.name=="pending",
                                // ),
                                itemAsString: (selectedItem) {
                                  selectedItem.name;
                                  selectedIdDropdown = selectedItem.id;
                                  // print("id = $selectedIdDropdown");
                                  return selectedItem.name;
                                },
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: kFieldOtpColor,
                                                width: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(8)))),
                                onChanged: (value) => print(value?.id),
                                dropdownBuilder: (context, selectedItem) =>
                                    Text(selectedItem?.name.toString() ??
                                        (state == 0
                                            ? "Anda belum memilih perusahaan"
                                            : "Tidak perlu memilih perusahaan")),
                              ),
                            ),
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
                                textInputType: TextInputType.phone,
                                hint: 'No hp anda ...',
                                controller: phoneController,
                                titleForm: 'Nomor Handphone'),
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
                                onTapEye: () {
                                  setState(() {
                                    eyeCondition = !eyeCondition;
                                  });
                                },
                                titleForm: 'Password',
                                hint: 'Password anda ...',
                                controller: passwordController),
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
                                onTapEye: () {
                                  setState(() {
                                    eyeCondition = !eyeCondition;
                                  });
                                },
                                titleForm: 'Konfirmasi Password',
                                hint: 'Konfirmasi Password anda ...',
                                controller: confirmPasswordController),
                            const SizedBox(
                              height: 16,
                            ),
                            BlocConsumer<AuthCubit, AuthState>(
                              listener: (context, state) {
                                if (state is GetOtpSuccess) {
                                  String textOtp =
                                      state.otpModel.data.otp.toString();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.green,
                                          content:
                                              Text("Kode OTP = $textOtp")));

                                  Navigator.pushNamed(context, 'otp');
                                } else if (state is GetOtpFailed) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.red,
                                          content:
                                              Text(state.error.toString())));
                                }
                              },
                              builder: (context, state) {
                                if (state is GetOtpLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return CustomPrimaryButton(
                                    title: 'Daftar',
                                    onPressed: () {
                                      // Navigator.pushNamed(context, 'otp');
                                      if (fullnameController.text == '' ||
                                          selectedIdDropdown == "Null" ||
                                          phoneController.text == '' ||
                                          confirmPasswordController.text ==
                                              '') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                backgroundColor: Colors.red,
                                                content: Text(
                                                    "Mohon Lengkapi data")));
                                      } else if (passwordController.text !=
                                          confirmPasswordController.text) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                backgroundColor: Colors.red,
                                                content: Text(
                                                    "Password dan Konfirmasi Password tidak sama !")));
                                      } else {
                                        context.read<AuthCubit>().getOTP(
                                            name: fullnameController.text
                                                .toString(),
                                            idCustomer: selectedIdDropdown,
                                            phone:
                                                phoneController.text.toString(),
                                            password: confirmPasswordController
                                                .text
                                                .toString());
                                      }
                                    });
                              },
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sudah punya akun? ',
                                  style: secondGreyTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'login');
                                  },
                                  child: Text(
                                    'Masuk akun',
                                    style: primaryTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          ]),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 41,
                                  width: 155,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/img_kalla_aspal.png'))),
                                ),
                                const SizedBox(
                                  height: 21,
                                )
                              ],
                            ))
                      ],
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
