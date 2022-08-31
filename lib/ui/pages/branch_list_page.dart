import 'package:ats_customer/cubit/branch_cubit.dart';
import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/card_daftar_cabang.dart';
import 'package:ats_customer/ui/widgets/custom_text_form_field_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchListPage extends StatelessWidget {
  const BranchListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerSearch =
        TextEditingController(text: '');

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: kWhiteColor,
              padding: const EdgeInsets.only(top: 48, left: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/icon_arrow_left.png",
                      height: 32,
                      width: 32,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 4,
              color: kDividerColor,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Daftar Cabang BSU",
                    style: blackTextStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Ketahui daftar cabang yang dimiliki PT. Bumi Sarana Utama",
                    style: secondGreyTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  // Row(
                  //   children: [
                  // Expanded(
                  //   child: CustomTextFormFieldIcon(
                  //       hintText: "Search",
                  //       cursorColor: kBlackColor,
                  //       controller: controllerSearch,
                  //       backgroundColor: kWhiteColor,
                  //       borderColor: kFieldOtpColor,
                  //       textInputType: TextInputType.text,
                  //       icon: "assets/icon_search.png",
                  //       textStyle: blackTextStyle.copyWith(
                  //           fontSize: 12, fontWeight: FontWeight.w400),
                  //       heightIcon: 16,
                  //       widthIcon: 16,
                  //       maxWidthIcon: 28,
                  //       maxHeightIcon: 32,
                  //       hintStyle: greyTextStyle.copyWith(
                  //           fontSize: 12, fontWeight: FontWeight.w400)),
                  // ),
                  // const SizedBox(
                  //   width: 8,
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 8, horizontal: 12),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8),
                  //       border: Border.all(color: kFieldOtpColor)),
                  //   child: Row(
                  //     children: [
                  //       Image.asset(
                  //         'assets/icon_filter.png',
                  //         height: 16,
                  //         width: 16,
                  //       ),
                  //       const SizedBox(
                  //         width: 4,
                  //       ),
                  //       Text(
                  //         'Filter',
                  //         style: greyTextStyle.copyWith(
                  //           fontSize: 12,
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   width: 8,
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 8, horizontal: 12),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8),
                  //       border: Border.all(color: kFieldOtpColor)),
                  //   child: Row(
                  //     children: [
                  //       Image.asset(
                  //         'assets/icon_sort.png',
                  //         height: 16,
                  //         width: 16,
                  //       ),
                  //       const SizedBox(
                  //         width: 4,
                  //       ),
                  //       Text(
                  //         'Sort',
                  //         style: greyTextStyle.copyWith(
                  //           fontSize: 12,
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  //   ],
                  // ),
                  //NOTED: CARD CABANG
                  BlocBuilder<BranchCubit, BranchState>(
                    builder: (context, state) {
                      if (state is GetBranchDataLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GetBranchDataSuccess) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.branchModel.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  CardDaftarCabang(
                                      title: state.branchModel[index].name,
                                      subtitle:
                                          state.branchModel[index].address,
                                      noHp: state.branchModel[index].phone),
                                  const SizedBox(
                                    height: 16,
                                  )
                                ],
                              );
                            });
                      }
                      return const Center(
                        child: Text("Data Perusahaan Kosong"),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
