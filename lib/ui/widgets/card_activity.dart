import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';

class CardActivity extends StatelessWidget {
  final Function() onPressed;
  const CardActivity({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: kDividerColor),
            boxShadow: [
              BoxShadow(
                  color: kBlackColor.withOpacity(0.04),
                  blurRadius: 6,
                  offset: const Offset(2, 0))
            ],
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: kHeaderCardActivityColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "No. pesanan 9232322123",
                    style: secondGreyTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        color: kOrangeColor,
                        borderRadius: BorderRadius.circular(40)),
                    child: Text(
                      'Disubmit',
                      style: whiteTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              padding: const EdgeInsets.only(
                  left: 16, top: 20, right: 16, bottom: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kampiri Wajo (PRE)",
                        style: darkGreyTextStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/icon_person.png",
                            height: 16,
                            width: 16,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Sharika",
                            style: darkGreyTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icon_volume_dark.png",
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          Text(
                            "50 MT",
                            style: darkGreyTextStyle.copyWith(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "12/12/2022",
                        style: darkGreyTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      )
                    ],
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
