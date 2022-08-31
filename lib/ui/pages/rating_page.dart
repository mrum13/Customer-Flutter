import 'package:ats_customer/cubit/rating_cubit.dart';
import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/custom_primary_button.dart';
import 'package:ats_customer/ui/widgets/custom_text_form_field.dart';
import 'package:ats_customer/ui/widgets/rating_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerSaran =
        TextEditingController(text: '');

    Widget buildStar(int ratingStar) {
      switch (ratingStar) {
        case 0:
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icon_star_1.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_0.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_0.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_0.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_0.png",
                height: 32,
                width: 32,
              ),
            ],
          );
        case 1:
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icon_star_1.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_1.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_0.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_0.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_0.png",
                height: 32,
                width: 32,
              ),
            ],
          );
        case 2:
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icon_star_1.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_1.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_1.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_0.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_0.png",
                height: 32,
                width: 32,
              ),
            ],
          );
        case 3:
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icon_star_1.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_1.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_1.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_1.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_0.png",
                height: 32,
                width: 32,
              ),
            ],
          );
        case 4:
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icon_star_1.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_1.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_1.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_1.png",
                height: 32,
                width: 32,
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                "assets/icon_star_1.png",
                height: 32,
                width: 32,
              ),
            ],
          );
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icon_star_1.png",
            height: 32,
            width: 32,
          ),
          const SizedBox(
            width: 12,
          ),
          Image.asset(
            "assets/icon_star_0.png",
            height: 32,
            width: 32,
          ),
          const SizedBox(
            width: 12,
          ),
          Image.asset(
            "assets/icon_star_0.png",
            height: 32,
            width: 32,
          ),
          const SizedBox(
            width: 12,
          ),
          Image.asset(
            "assets/icon_star_0.png",
            height: 32,
            width: 32,
          ),
          const SizedBox(
            width: 12,
          ),
          Image.asset(
            "assets/icon_star_0.png",
            height: 32,
            width: 32,
          ),
        ],
      );
    }

    return Scaffold(
        backgroundColor: kBackgroundGreyColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //NOTED : HEADER
              Container(
                color: kWhiteColor,
                padding: const EdgeInsets.only(top: 48, left: 16, bottom: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/icon_arrow_left.png",
                        height: 24,
                        width: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Detail Pemesanan",
                      style: blackTextStyle.copyWith(
                          fontSize: 13, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),

              //NOTED: RATING CONTAINER
              Container(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                ),
                child: Column(
                  children: [
                    Text(
                      "Kasih rating ke driver ?",
                      style: blackTextStyle.copyWith(
                          fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "(1 mengecewakan, 5 mantap!)",
                      style: blackTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    BlocBuilder<RatingCubit, int>(
                      builder: (context, indexStar) {
                        return Stack(
                          children: [
                            buildStar(indexStar),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                RatingStar(
                                  index: 0,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                RatingStar(
                                  index: 1,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                RatingStar(
                                  index: 2,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                RatingStar(
                                  index: 3,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                RatingStar(
                                  index: 4,
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),

              //NOTED: BODY
              Container(
                decoration: BoxDecoration(color: kWhiteColor),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Punya saran untuk kami?",
                      style: blackTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                        textStyle: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        hintStyle: greyTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        obscureText: false,
                        hintText: "Detail masalah...",
                        controller: controllerSaran,
                        backgroundColor: kWhiteColor,
                        borderColor: kFieldOtpColor,
                        textInputType: TextInputType.text,
                        maxLines: 5),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Lampiran",
                      style: blackTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Anda juga dapat melampirkan gambar",
                      style: greyTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                          border: Border.all(color: kFieldOtpColor),
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfff5f5f5),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Image.asset(
                            "assets/icon_add_photo.png",
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Format foto .JPG .Jpeg dan .PNG",
                      style: greyTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Ukursan maks. 10 MB",
                      style: greyTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomPrimaryButton(
                        title: "Selesai",
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, "detail-order", (route) => false);
                        }),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
