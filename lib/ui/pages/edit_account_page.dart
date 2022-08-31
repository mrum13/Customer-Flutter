import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/custom_button.dart';
import 'package:ats_customer/ui/widgets/custom_primary_button.dart';
import 'package:ats_customer/ui/widgets/custom_text_form_field.dart';
import 'package:ats_customer/ui/widgets/form_input_field.dart';
import 'package:ats_customer/ui/widgets/form_input_field_icon.dart';
import 'package:flutter/material.dart';

enum JenisKelamin { laki_laki, perempuan }

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({Key? key}) : super(key: key);

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  JenisKelamin? _jenisKelamin = JenisKelamin.laki_laki;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerNama =
        TextEditingController(text: '');

    final TextEditingController controllerTempatLahir =
        TextEditingController(text: '');

    final TextEditingController controllerTanggalLahir =
        TextEditingController(text: '');

    final TextEditingController controllerNo = TextEditingController(text: '');

    final TextEditingController controllerAlamat =
        TextEditingController(text: '');

    String dropProvinsi = 'Sulawesi Selatan';
    String dropKota = 'Makassar';

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Edit Akun",
                    style: blackTextStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 4,
              width: double.infinity,
              color: kFieldOtpColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      hint: "Masukkan nama ...",
                      controller: controllerNama,
                      titleForm: "Nama"),
                  const SizedBox(
                    height: 22,
                  ),
                  FormInputField(
                      textStyle: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      hintStyle: greyTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      hint: "Masukkan tempat lahir ...",
                      controller: controllerTempatLahir,
                      titleForm: "Tampat Lahir"),
                  const SizedBox(
                    height: 22,
                  ),
                  FormInputFieldIcon(
                      cursorColor: kBlackColor,
                      icon: "assets/icon_date_form.png",
                      heightIcon: 20,
                      widthIcon: 20,
                      maxHeightIcon: 48,
                      maxWidthIcon: 34,
                      backgroundColor: kWhiteColor,
                      borderColor: kFieldOtpColor,
                      textInputType: TextInputType.datetime,
                      titleColor: kBlackColor,
                      textStyle: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      hintStyle: secondGreyTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      hint: "Masukkan tanggal lahir ...",
                      controller: controllerTanggalLahir,
                      titleForm: "Tanggal Lahir"),
                  const SizedBox(
                    height: 22,
                  ),
                  FormInputField(
                      textStyle: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      hintStyle: greyTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      hint: "Masukkan no hp ...",
                      controller: controllerNo,
                      titleForm: "Nomor Handphone"),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Text(
                        'Jenis Kelamin',
                        style: blackTextStyle.copyWith(
                            fontSize: 16,
                            color: kBlackColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '*',
                        style: redTextStyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ListTile(
                    minVerticalPadding: 0,
                    minLeadingWidth: 20,
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Laki-Laki',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    leading: Radio<JenisKelamin>(
                      value: JenisKelamin.laki_laki,
                      groupValue: _jenisKelamin,
                      onChanged: (JenisKelamin? value) {
                        setState(() {
                          _jenisKelamin = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.all(0),
                    title: Text('Perempuan',
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                    leading: Radio<JenisKelamin>(
                      value: JenisKelamin.perempuan,
                      groupValue: _jenisKelamin,
                      onChanged: (JenisKelamin? value) {
                        setState(() {
                          _jenisKelamin = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  FormInputField(
                      textStyle: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      hintStyle: greyTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      hint: "Masukkan alamat ...",
                      controller: controllerNo,
                      titleForm: "Alamat"),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Text(
                        'Provinsi',
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '*',
                        style: redTextStyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: kFieldOtpColor, width: 1),
                        borderRadius: BorderRadius.circular(8)),
                    child: DropdownButton<String>(
                      icon: Image.asset(
                        'assets/icon_dropdown.png',
                        width: 20,
                        height: 20,
                      ),
                      underline: Container(
                        color: kWhiteColor,
                      ),
                      isExpanded: true,
                      hint: Text('Pilih Provinsi'),
                      value: dropProvinsi,
                      style: blackTextStyle.copyWith(fontSize: 16),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropProvinsi = newValue!;
                        });
                      },
                      items: [
                        'Sulawesi Selatan',
                        'Sulawesi Tenggara',
                        'Sulawesi Barat',
                        'Sulawesi Tengah',
                        'Sulawesi Utara',
                        'Gorontalo'
                      ].map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Text(
                        'Kota',
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '*',
                        style: redTextStyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: kFieldOtpColor, width: 1),
                        borderRadius: BorderRadius.circular(8)),
                    child: DropdownButton<String>(
                      icon: Image.asset(
                        'assets/icon_dropdown.png',
                        width: 20,
                        height: 20,
                      ),
                      underline: Container(
                        color: kWhiteColor,
                      ),
                      isExpanded: true,
                      hint: Text('Pilih Kota'),
                      value: dropKota,
                      style: blackTextStyle.copyWith(fontSize: 16),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropKota = newValue!;
                        });
                      },
                      items: [
                        'Makassar',
                        'Bulukumba',
                        'Pinrang',
                        'Barru',
                        'Pangkep'
                      ].map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                            title: "Batal",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            borderColor: kPrimaryColor,
                            backgroundColor: kWhiteColor,
                            textStyle: primaryTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: CustomPrimaryButton(
                              title: "Simpan", onPressed: () {}))
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
