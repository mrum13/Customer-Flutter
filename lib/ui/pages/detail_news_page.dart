import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';

class DetailNewsPage extends StatelessWidget {
  const DetailNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 48,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Image.asset(
                "assets/icon_arrow_left.png",
                height: 32,
                width: 32,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: kDividerHeaderColor,
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  "33 Tahun Berkiprah, Kalla Aspal Hadirkan Layanan Optimal hingga Pelosok Negeri",
                  style: blackTextStyle.copyWith(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 176,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          image: AssetImage("assets/img_news_1.png"))),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Sejak tahun 1988, Kalla Aspal hadir memberikan pelayanan terbaik sebagai perusahaan yang telah berkontribusi sebagai agen aspal curah.\n\nKalla Beton ikut serta dalam beberapa pembangunan jalan di berbagai wilayah. Kalla Aspal kini meningkatkan pelayanannya dengan melakukan distribusi aspal hingga pelosok negeri. Hal ini merupakan komitmen Kalla Aspal guna memberikan layanan optimal.\n\nKalla Aspal optimis akan menjadi market leader menguasai market share hingga 70 persen di seluruh wilayah pemasaran. Khusus wilayah Makassar, Kalla Aspal telah menguasai pasar hingga 76 persen.",
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w400),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
