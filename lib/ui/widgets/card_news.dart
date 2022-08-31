import 'package:ats_customer/shared/theme.dart';
import 'package:flutter/material.dart';

class CardNews extends StatelessWidget {
  const CardNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 128,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/img_news_1.png",
                    ))),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "33 Tahun Berkiprah, Kalla Aspal Hadirkan Layanan Optimal hingga Pelosok Negeri sampai maju",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: blackTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'detail-news');
            },
            child: Text(
              "Selengkapnya",
              style: primaryTextStyle.copyWith(
                  fontWeight: FontWeight.w700, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
