import 'package:ats_customer/cubit/button_volume_cubit.dart';
import 'package:ats_customer/cubit/button_volume_selected_cubit.dart';
import 'package:ats_customer/cubit/contract_card_cubit.dart';
import 'package:ats_customer/cubit/order_po_cubit.dart';
import 'package:ats_customer/models/volume_model.dart';
import 'package:ats_customer/shared/shared_prefrences.dart';
import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/background_order.dart';
import 'package:ats_customer/ui/widgets/card_contract.dart';
import 'package:ats_customer/ui/widgets/custom_button.dart';
import 'package:ats_customer/ui/widgets/custom_button_volume.dart';
import 'package:ats_customer/ui/widgets/custom_primary_button.dart';
import 'package:ats_customer/ui/widgets/custom_text_form_field_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String selectedDate = 'Pilih tanggal ...';
  String timeSelected = 'Pilih jam ...';
  bool indexButtonVolumeLainnya = false;

  String idContract = "null";
  String idCustomer = "null";

  String? volumenya = "kosong";
  String? volumeTextField = "kosong";
  String? volumeData = "kosong";

  void onSelectionChange(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      selectedDate = DateFormat('yyyy-MM-dd').format(args.value);
      Navigator.pop(context);
    });
  }

  TimeOfDay selectedTime = TimeOfDay.now();
  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        // timeSelected = DateFormat();
        timeSelected = "${selectedTime.hour}:${selectedTime.minute}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String dropValueAmpTujuan = 'Makassar';
    final TextEditingController volumeController =
        TextEditingController(text: '');
    SharedPreference.orderPO?.setString("button_volume", "kosong");

    Widget dropdownContractOld() {
      return DropdownButton<String>(
        icon: Image.asset(
          'assets/icon_dropdown.png',
          width: 20,
          height: 20,
        ),
        underline: Container(
          color: kWhiteColor,
        ),
        isExpanded: true,
        hint: Text('Pilih AMP tujuan'),
        value: dropValueAmpTujuan,
        style: blackTextStyle.copyWith(fontSize: 16, color: Colors.black),
        onChanged: (String? newValue) {
          setState(() {
            dropValueAmpTujuan = newValue!;
          });
        },
        items: ['Makassar', 'Bulukumba', 'Pinrang', 'Barru', 'Pangkep']
            .map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        }).toList(),
      );
    }

    String validateAllData() {
      volumenya = SharedPreference.orderPO.getString("button_volume");
      volumeTextField = volumeController.text.toString();

      if (volumenya == "lainnya") {
        if (volumeTextField == "") {
          volumeData = "kosong";
        } else {
          volumeData = volumeTextField;
        }
      } else {
        volumeData = volumenya;
      }

      if (idContract == "null" ||
          idCustomer == "null" ||
          volumeData == "kosong" ||
          selectedDate == "Pilih tanggal ..." ||
          timeSelected == "Pilih jam ...") {
        return "gagal";
      } else {
        return "berhasil";
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            BackgroundOrder(),
            Column(
              children: [
                const SizedBox(
                  height: 72,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Aspal',
                        style: whiteTextStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Order aspal kini lebih nyaman dan cepat',
                        style: kallaPointsTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Kontrak',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                            BlocBuilder<ContractCardCubit, ContractCardState>(
                              builder: (context, state) {
                                if (state is ContractCardSelected) {
                                  idContract = state.idContract.toString();
                                }
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        idCustomer = SharedPreference.loginUser
                                            .getString("id_customer");
                                        context
                                            .read<ContractCardCubit>()
                                            .getContractData(
                                                idCustomer: idCustomer);
                                        Navigator.pushNamed(
                                            context, "contract");
                                      },
                                      child: Container(
                                          height: 48,
                                          padding: const EdgeInsets.only(
                                              right: 10, left: 16),
                                          decoration: BoxDecoration(
                                              color: kWhiteColor,
                                              border: Border.all(
                                                  color: kFieldOtpColor,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                state is ContractCardSelected
                                                    ? state.contractNo
                                                    : "Pilih Kontrak",
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Image.asset(
                                                "assets/icon_dropdown.png",
                                                height: 20,
                                                width: 20,
                                              )
                                            ],
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'AMP Tujuan',
                                          style: blackTextStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
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
                                      width: double.infinity,
                                      height: 48,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14, horizontal: 16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: kWhiteColor,
                                          border: Border.all(
                                              color: kFieldOtpColor)),
                                      child: Text(
                                        state is ContractCardSelected
                                            ? state.ampDestination
                                            : "Pilih Kontrak",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Sisa',
                                          style: blackTextStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
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
                                      width: double.infinity,
                                      height: 48,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14, horizontal: 16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: kWhiteColor,
                                          border: Border.all(
                                              color: kFieldOtpColor)),
                                      child: Text(
                                        state is ContractCardSelected
                                            ? "${state.remaining} MT"
                                            : "Pilih Kontrak",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),

                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Volume',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                            BlocBuilder<ButtonVolumeCubit, ButtonVolumeState>(
                              builder: (context, state) {
                                if (state is GetVolumeDataLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is GetVolumeDataSuccess) {
                                  return Column(
                                    children: [
                                      GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisSpacing: 8,
                                            mainAxisSpacing: 8,
                                            childAspectRatio:
                                                MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    (MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        4),
                                            crossAxisCount: 2,
                                          ),
                                          itemCount: state.volumeModel.length,
                                          itemBuilder: (context, indexData) {
                                            return CustomButtonVolume(
                                              text:
                                                  "${state.volumeModel[indexData].volume.toString()} TON",
                                              index: indexData,
                                              volume: state
                                                  .volumeModel[indexData].volume
                                                  .toString(),
                                            );
                                          }),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      BlocConsumer<ButtonVolumeSelectedCubit,
                                          ButtonVolumeSelectedState>(
                                        listener: (context, state) {
                                          if (state
                                              is ButtonVolumeLainnyaSelected) {
                                            indexButtonVolumeLainnya = true;
                                          } else {
                                            indexButtonVolumeLainnya = false;
                                            volumeController.text = "";
                                          }
                                        },
                                        builder: (context, state) {
                                          return SizedBox(
                                            width: double.infinity,
                                            height: 48,
                                            child: TextField(
                                              onTap: () {
                                                context
                                                    .read<
                                                        ButtonVolumeSelectedCubit>()
                                                    .setButtonVolumeLainnya();
                                              },
                                              controller: volumeController,
                                              maxLines: 1,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: kWhiteColor,
                                                  contentPadding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 12,
                                                          vertical: 14.0),
                                                  isDense: true,
                                                  hintText: "Lainnya",
                                                  hintStyle: greyTextStyle.copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide: BorderSide(
                                                          color: indexButtonVolumeLainnya
                                                              ? kPrimaryColor
                                                              : kFieldOtpColor)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          BorderSide(color: indexButtonVolumeLainnya ? kPrimaryColor : kFieldOtpColor))),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                }
                                return Center(
                                  child: Text("Tidak ada data volume"),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Tanggal Rencana Bongkar',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 100,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 64, horizontal: 16),
                                        decoration: BoxDecoration(
                                            color: kWhiteColor,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: SfDateRangePicker(
                                          selectionMode:
                                              DateRangePickerSelectionMode
                                                  .single,
                                          onSelectionChanged: onSelectionChange,
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 14),
                                height: 48,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: kFieldOtpColor),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/icon_date_form.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      selectedDate,
                                      style: selectedDate == "Pilih tanggal ..."
                                          ? secondGreyTextStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400)
                                          : blackTextStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // CustomTextFormFieldIcon(
                            //     cursorColor: kBlackColor,
                            //     hintStyle: secondGreyTextStyle.copyWith(
                            //         fontSize: 16, fontWeight: FontWeight.w400),
                            //     hintText: 'Sab, 12 Mar 2022',
                            //     controller: controllerTanggalRencanaBongkar,
                            //     backgroundColor: kWhiteColor,
                            //     borderColor: kFieldOtpColor,
                            //     textInputType: TextInputType.text,
                            //     icon: 'assets/icon_date_form.png',
                            //     heightIcon: 20,
                            //     widthIcon: 20,
                            //     maxHeightIcon: 48,
                            //     maxWidthIcon: 34,
                            //     textStyle: blackTextStyle.copyWith(
                            //         fontSize: 16, fontWeight: FontWeight.w500)),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Jam Rencana Bongkar',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                            // CustomTextFormFieldIcon(
                            //     cursorColor: kBlackColor,
                            //     hintStyle: secondGreyTextStyle.copyWith(
                            //         fontSize: 16, fontWeight: FontWeight.w400),
                            //     hintText: '24:00',
                            //     controller: controllerTanggalRencanaBongkar,
                            //     backgroundColor: kWhiteColor,
                            //     borderColor: kFieldOtpColor,
                            //     textInputType: TextInputType.datetime,
                            //     icon: 'assets/icon_clock.png',
                            //     heightIcon: 20,
                            //     widthIcon: 20,
                            //     maxHeightIcon: 48,
                            //     maxWidthIcon: 34,
                            //     textStyle: blackTextStyle.copyWith(
                            //         fontSize: 16, fontWeight: FontWeight.w500)),
                            GestureDetector(
                              onTap: () {
                                _selectTime(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 14),
                                height: 48,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: kFieldOtpColor),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/icon_clock.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      timeSelected,
                                      style: timeSelected == "Pilih jam ..."
                                          ? secondGreyTextStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400)
                                          : blackTextStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CustomPrimaryButton(
                                title: "Buat DO",
                                onPressed: () {
                                  validateAllData();
                                  if (validateAllData() != "berhasil") {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                                "Mohon lengkapi data sebelum buat DO")));
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            insetPadding:
                                                const EdgeInsets.all(10),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Container(
                                              height: 350,
                                              padding: const EdgeInsets.all(16),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Image.asset(
                                                          'assets/icon_dialog_close.png',
                                                          height: 24,
                                                          width: 24,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Image.asset(
                                                    'assets/icon_dialog_question.png',
                                                    height: 94,
                                                    width: 94,
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                  Text(
                                                    'Apakah anda yakin ?',
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    'Yakin data yang anda masukkan\nsudah sesuai ?',
                                                    textAlign: TextAlign.center,
                                                    style: secondGreyTextStyle
                                                        .copyWith(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                  ),
                                                  const SizedBox(
                                                    height: 12,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: CustomButton(
                                                            title: "Kembali",
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            borderColor:
                                                                kPrimaryColor,
                                                            backgroundColor:
                                                                kWhiteColor,
                                                            textStyle: primaryTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                      ),
                                                      const SizedBox(
                                                        width: 12,
                                                      ),
                                                      Expanded(
                                                          child:
                                                              CustomPrimaryButton(
                                                                  title:
                                                                      "Ya, saya yakin",
                                                                  onPressed:
                                                                      () {
                                                                    context.read<OrderPoCubit>().postPO(
                                                                        idContract:
                                                                            idContract,
                                                                        idCustomer:
                                                                            idCustomer,
                                                                        volume: volumeData
                                                                            .toString(),
                                                                        date:
                                                                            selectedDate,
                                                                        time:
                                                                            timeSelected);
                                                                    Navigator.pop(
                                                                        context);
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Dialog(
                                                                            insetPadding:
                                                                                const EdgeInsets.all(10),
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                                                            child:
                                                                                BlocBuilder<OrderPoCubit, OrderPoState>(
                                                                              builder: (context, state) {
                                                                                if (state is OrderPoLoading) {
                                                                                  return const Center(
                                                                                    child: CircularProgressIndicator(),
                                                                                  );
                                                                                } else if (state is OrderPoSuccess) {
                                                                                  return Container(
                                                                                    height: 350,
                                                                                    padding: const EdgeInsets.all(16),
                                                                                    child: Column(
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                          children: [
                                                                                            GestureDetector(
                                                                                              onTap: () {
                                                                                                Navigator.pop(context);
                                                                                              },
                                                                                              child: Image.asset(
                                                                                                'assets/icon_dialog_close.png',
                                                                                                height: 24,
                                                                                                width: 24,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                        const SizedBox(
                                                                                          height: 5,
                                                                                        ),
                                                                                        Image.asset(
                                                                                          'assets/icon_dialog_check.png',
                                                                                          height: 94,
                                                                                          width: 94,
                                                                                        ),
                                                                                        const SizedBox(
                                                                                          height: 16,
                                                                                        ),
                                                                                        Text(
                                                                                          'Selamat, Pemesanan Berhasil',
                                                                                          style: blackTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                                                                                        ),
                                                                                        const SizedBox(
                                                                                          height: 4,
                                                                                        ),
                                                                                        Text(
                                                                                          'Pemesanan anda saat ini dalam tahap menunggu konfirmasi marketing',
                                                                                          textAlign: TextAlign.center,
                                                                                          style: secondGreyTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                                                                                        ),
                                                                                        const SizedBox(
                                                                                          height: 12,
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: CustomPrimaryButton(
                                                                                                  title: "Ya, saya paham",
                                                                                                  onPressed: () {
                                                                                                    Navigator.pop(context);
                                                                                                  }),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        const SizedBox(
                                                                                          height: 16,
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                } else if (state is OrderPoFailed) {
                                                                                  return Container(
                                                                                    height: 350,
                                                                                    padding: const EdgeInsets.all(16),
                                                                                    child: Column(
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                          children: [
                                                                                            GestureDetector(
                                                                                              onTap: () {
                                                                                                Navigator.pop(context);
                                                                                              },
                                                                                              child: Image.asset(
                                                                                                'assets/icon_dialog_close.png',
                                                                                                height: 24,
                                                                                                width: 24,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                        const SizedBox(
                                                                                          height: 5,
                                                                                        ),
                                                                                        Image.asset(
                                                                                          'assets/icon_dialog_question.png',
                                                                                          height: 94,
                                                                                          width: 94,
                                                                                        ),
                                                                                        const SizedBox(
                                                                                          height: 16,
                                                                                        ),
                                                                                        Text(
                                                                                          'Maaf, Ada Kesalahan',
                                                                                          style: blackTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                                                                                        ),
                                                                                        const SizedBox(
                                                                                          height: 4,
                                                                                        ),
                                                                                        Text(
                                                                                          state.error.toString(),
                                                                                          textAlign: TextAlign.center,
                                                                                          style: secondGreyTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                                                                                        ),
                                                                                        const SizedBox(
                                                                                          height: 12,
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: CustomPrimaryButton(
                                                                                                  title: "Ya, saya paham",
                                                                                                  onPressed: () {
                                                                                                    Navigator.pop(context);
                                                                                                  }),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        const SizedBox(
                                                                                          height: 16,
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  return SizedBox();
                                                                                }
                                                                              },
                                                                            ),
                                                                          );
                                                                        });
                                                                  })),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  }
                                }),
                            const SizedBox(
                              height: 29,
                            )
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   height: 24,
                      // ),
                      // Text(
                      //   'Transaksi terakhir',
                      //   style: blackTextStyle.copyWith(
                      //       fontSize: 13, fontWeight: FontWeight.w600),
                      // ),
                      // const SizedBox(
                      //   height: 16,
                      // ),
                      // Container(
                      //   width: double.infinity,
                      //   padding: const EdgeInsets.symmetric(vertical: 16),
                      //   decoration: BoxDecoration(
                      //       color: kWhiteColor,
                      //       borderRadius: BorderRadius.circular(8)),
                      //   child: Column(
                      //     children: [
                      //       Image.asset(
                      //         'assets/icon_not_activity_yet.png',
                      //         width: 58,
                      //         height: 58,
                      //       ),
                      //       Text(
                      //         'Belum ada aktifitas',
                      //         style: blackTextStyle.copyWith(
                      //             fontSize: 12, fontWeight: FontWeight.w600),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 45,
                      // )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
