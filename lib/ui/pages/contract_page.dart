import 'package:ats_customer/cubit/contract_card_cubit.dart';
import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/card_contract.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContractPage extends StatelessWidget {
  const ContractPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/icon_dialog_close.png",
                    height: 32,
                    width: 32,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Kontrak",
              style: blackTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<ContractCardCubit, ContractCardState>(
              builder: (context, state) {
                if (state is GetContractDataLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetContractDataSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.contractModel.length,
                    itemBuilder: (context, index) {
                      return CardContract(
                          title:
                              "AMP Tujuan ${state.contractModel[index].name}",
                          contractNo: state.contractModel[index].contractNumber,
                          remaining: state.contractModel[index].tonnageRemaining
                              .toString(),
                          ontap: () {
                            context
                                .read<ContractCardCubit>()
                                .selectCardContract(
                                  idContract: state.contractModel[index].id,
                                  contractNo:
                                      state.contractModel[index].contractNumber,
                                  ampDestination:
                                      state.contractModel[index].name,
                                  remaining: state
                                      .contractModel[index].tonnageRemaining
                                      .toString(),
                                );
                            Navigator.pop(context);
                          });
                    },
                  );
                }
                return const Center(
                  child: Text("Tidak ada data"),
                );
              },
            )
          ],
        ),
      ),
    ));
  }
}
