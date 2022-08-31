import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/form_input_field.dart';
import 'package:flutter/material.dart';

class CallAdminPage extends StatelessWidget {
  const CallAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerNama =
        TextEditingController(text: '');
    final TextEditingController controllerNo = TextEditingController(text: '');
    final TextEditingController controllerDeskripsi =
        TextEditingController(text: '');

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              //NOTED : BACKGROUND
              Stack(
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
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        margin: const EdgeInsets.only(top: 48, left: 16),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/icon_arrow_left_white.png'))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Hubungi Admin',
                  style: whiteTextStyle.copyWith(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      FormInputField(
                        textStyle: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        hintStyle: whiteTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        backgroundColor:
                            const Color.fromRGBO(255, 255, 255, 0.2),
                        borderColor: kTransparentColor,
                        titleColor: kWhiteColor,
                        hint: 'Nama anda ...',
                        controller: controllerNama,
                        titleForm: 'Nama',
                        textInputType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      FormInputField(
                        textStyle: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        hintStyle: whiteTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),
                        borderColor: kTransparentColor,
                        titleColor: kWhiteColor,
                        hint: 'Nomor hp anda ...',
                        controller: controllerNo,
                        titleForm: 'No Handphone',
                        textInputType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      FormInputField(
                        textStyle: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        hintStyle: whiteTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),
                        borderColor: kTransparentColor,
                        titleColor: kWhiteColor,
                        hint: 'Masukkan deskripsi ...',
                        controller: controllerDeskripsi,
                        titleForm: 'Deskripsi Kendala',
                        textInputType: TextInputType.multiline,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        margin: EdgeInsets.zero,
                        width: double.infinity,
                        height: 48,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: kSecondBlueColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Kirim',
                            style: whiteTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ],
          )),
    );
  }
}
