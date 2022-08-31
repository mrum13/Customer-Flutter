import 'dart:convert';

import 'package:ats_customer/cubit/data_company_switch_cubit.dart';
import 'package:ats_customer/cubit/user_cubit.dart';
import 'package:ats_customer/models/company_switch_model.dart';
import 'package:ats_customer/models/list_company_model.dart';
import 'package:ats_customer/shared/shared_prefrences.dart';
import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/card_switch_perusahaan.dart';
import 'package:ats_customer/ui/widgets/custom_button.dart';
import 'package:ats_customer/ui/widgets/custom_button_icon.dart';
import 'package:ats_customer/ui/widgets/custom_primary_button.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedIdDropdown = "Null";

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

    Widget popupButton() {
      return PopupMenuButton(
          itemBuilder: (context) => [
                const PopupMenuItem(
                  child: Text('Item 1'),
                ),
                const PopupMenuItem(
                  child: Text('Item 2'),
                ),
                const PopupMenuItem(
                  child: Text('Item 3'),
                ),
              ]);
    }

    Widget bottomSheet2() {
      return Container(
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(8),
            )),
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 16),
        child: BlocBuilder<DataCompanySwitchCubit, DataCompanySwitchState>(
          builder: (context, state) {
            if (state is DataCompanySwitchLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is DataCompanySwitchSuccess) {
              return ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icon_dialog_bottom_sheet.png",
                        height: 4,
                        width: 32,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icon_dialog_switch_company.png",
                        height: 94,
                        width: 94,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  //dropdown
                  DropdownSearch<ListCompanyData>(
                    asyncItems: (text) async {
                      String token =
                          SharedPreference.loginUser.getString("token");
                      var url =
                          'http://103.142.111.167:10002/api/customerswitchcompany/companyavailable';
                      var header = {
                        'Accept': 'application/json',
                        'Authorization': 'Bearer $token'
                      };
                      var response =
                          await http.get(Uri.parse(url), headers: header);
                      var data = json.decode(response.body);
                      if (response.statusCode != 200) {
                        return [];
                      }
                      List allCompany = (json.decode(response.body)
                          as Map<String, dynamic>)["data"];
                      List<ListCompanyData> allNameCompany = [];

                      allCompany.forEach((element) {
                        allNameCompany.add(ListCompanyData(
                            id: element["id"],
                            name: element["name"],
                            status: element["status"],
                            regencyName: element["regency_name"]));
                      });
                      return allNameCompany;
                    },
                    popupProps: PopupProps.menu(
                      // showSelectedItems: true,
                      disabledItemFn: (ListCompanyData s) =>
                          s.status == "pending",
                    ),
                    itemAsString: (selectedItem) {
                      selectedItem.name;
                      selectedIdDropdown = selectedItem.id;

                      return selectedItem.name;
                    },
                    dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: kFieldOtpColor, width: 0.1),
                                borderRadius: BorderRadius.circular(8)))),
                    onChanged: (value) => print(value?.id),
                    // dropdownBuilder: (context, selectedItem) =>
                    //     Text(selectedItem!.name.toString()),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomPrimaryButton(
                      title: "Tambah Perusahaan",
                      onPressed: () {
                        if (selectedIdDropdown == "Null") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                      "Mohon pilih perusahaan terlebih dahulu")));
                        } else {
                          context
                              .read<DataCompanySwitchCubit>()
                              .postDataCompany(idCustomer: selectedIdDropdown);
                          Navigator.pushNamed(context, 'loading-add-company');
                        }
                      })
                ],
              );
            } else if (state is DataCompanySwitchFailed) {
              return const Center(
                child: Text("Data gagal dimuat"),
              );
            }
            return const Center(child: Text("Data gagal dimuat"));
          },
        ),
      );
    }

    Widget bottomSheet1() => DraggableScrollableSheet(
          initialChildSize: 0.5,
          maxChildSize: 0.7,
          minChildSize: 0.5,
          builder: (context, scrollController) => Container(
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                )),
            padding:
                const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 16),
            child: BlocBuilder<DataCompanySwitchCubit, DataCompanySwitchState>(
              builder: (context, state) {
                if (state is DataCompanySwitchLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is DataCompanySwitchSuccess) {
                  return ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icon_dialog_bottom_sheet.png",
                            height: 4,
                            width: 32,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icon_dialog_switch_company.png",
                            height: 94,
                            width: 94,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ListView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          itemCount: state.listCompanyModel.length,
                          itemBuilder: ((context, index) {
                            return CardSwitchCompany(
                                status: state.listCompanyModel[index].active,
                                title: state.listCompanyModel[index].name,
                                subtitle: state.listCompanyModel[index].name,
                                index: index);
                          })),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomButtonIcon(
                          title: "Tambah Perusahaan",
                          onPressed: () {
                            Navigator.pop(context);
                            showModalBottomSheet(
                                isScrollControlled: false,
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16.0),
                                  ),
                                ),
                                backgroundColor:
                                    kTransparentColor, // <-- SEE HERE
                                builder: (context) => bottomSheet2());
                          })
                    ],
                  );
                } else if (state is DataCompanySwitchFailed) {
                  return const Center(
                    child: Text("Data gagal dimuat"),
                  );
                }
                return const Center(child: Text("Data gagal dimuat"));
              },
            ),
          ),
        );

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is GetUserSuccess) {
          return Scaffold(
            backgroundColor: kWhiteColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 48,
                    ),
                    Text(
                      "Akun",
                      style: blackTextStyle.copyWith(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Lengkapi data diri anda agar kami bisa lebih membantu lagi",
                      style: secondGreyTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: kWhiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(8)),
                      // padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/img_profile_account.png",
                                height: 88,
                                width: 88,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.userModel.data.name,
                                    style: blackTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 12),
                                    decoration: BoxDecoration(
                                        color: kGreenColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      "Pemilik",
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          PopupMenuButton(
                            padding: EdgeInsets.zero,
                            child: Container(
                              height: 32,
                              width: 32,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/icon_option_account.png"))),
                            ),
                            itemBuilder: (BuildContext context) => [
                              PopupMenuItem(
                                  value: 0,
                                  child: Text(
                                    "Edit",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  )),
                              PopupMenuItem(
                                  value: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, "login", (route) => false);
                                    },
                                    child: Text(
                                      "Logout",
                                      style: redTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )),
                            ],
                            onSelected: (choice) {
                              switch (choice) {
                                case 0:
                                  Navigator.pushNamed(context, "edit-account");
                                  break;
                                case 1:
                                  // code for the remove action
                                  break;
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Nomor Handphone",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      state.userModel.data.phone,
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "TTL",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${state.userModel.data.birthPlace}" == "null" ||
                              "${state.userModel.data.birthDate}" == "null"
                          ? "-"
                          : "${state.userModel.data.birthPlace}, ${state.userModel.data.birthDate}",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Jenis Kelamin",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      state.userModel.data.gender == null
                          ? "-"
                          : state.userModel.data.gender,
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "NIK",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${state.userModel.data.nik}" != "null"
                          ? "${state.userModel.data.nik}"
                          : "-",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Alamat",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${state.userModel.data.address}" != "null"
                          ? "${state.userModel.data.address}"
                          : "-",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Kota",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${state.userModel.data.idRegency}" != "null"
                          ? "${state.userModel.data.idRegency}"
                          : "-",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Provinsi",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${state.userModel.data.idProvince}" != "null"
                          ? "${state.userModel.data.idProvince}"
                          : "-",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "PT. Tristar Sulawesi Mandiri & AMP",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomButton(
                        title: "Ganti Perusahaan",
                        onPressed: () {
                          context
                              .read<DataCompanySwitchCubit>()
                              .getDataCompany();
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16.0),
                                ),
                              ),
                              backgroundColor:
                                  kTransparentColor, // <-- SEE HERE
                              builder: (context) => bottomSheet1());
                        },
                        borderColor: kPrimaryColor,
                        backgroundColor: kWhiteColor,
                        textStyle: primaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Pusat bantuan",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'user-guide');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: kPrimaryColor)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icon_help.png",
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Panduan Penggunaan",
                              style: blackTextStyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        openwhatsapp();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: kPrimaryColor)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icon_headset.png",
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Hubungi Admin",
                              style: blackTextStyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
