import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/widgets/card_inbox.dart';
import 'package:ats_customer/ui/widgets/card_inbox_ongoing.dart';
import 'package:ats_customer/ui/widgets/custom_text_form_field_icon.dart';
import 'package:ats_customer/ui/widgets/inbox_tab.dart';
import 'package:flutter/material.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerSearch =
        TextEditingController(text: '');

    Widget staticCardInboxOld() {
      return Column(
        children: [
          const CardInbox(
            title: "Kampiri Wajo",
            subtitle: "No. pesanan 9232322123",
            volume: "50 MT",
            titleAnswer: "Marketing belum memproses pesanan saya",
            titleCardAnswer: "Kampiri Wajo",
            subtitleCardAnswer: "No. 9232322123",
            volumeCardAnswer: "50 MT",
            contentAnswer:
                "Saya memiliki masalah dibagian proses pemesanan yang sangat lama.",
            answer:
                "Sebelumnya mohon maaf atas ketidaknyaman yang anda alami, kami senantiasa akan terus membantu anda.Kesalahan yang anda alami mungkin terjadi karena ada faktor-faktor yang mempengarui sehingga kami akan seger memperbaiki itu.",
          ),
          const SizedBox(
            height: 12,
          ),
          const CardInbox(
            title: "Kampiri Wajo",
            subtitle: "No. pesanan 9232322123",
            volume: "50 MT",
            titleAnswer: "Marketing belum memproses pesanan saya",
            titleCardAnswer: "Kampiri Wajo",
            subtitleCardAnswer: "No. 9232322123",
            volumeCardAnswer: "50 MT",
            contentAnswer:
                "Saya memiliki masalah dibagian proses pemesanan yang sangat lama.",
            answer:
                "Sebelumnya mohon maaf atas ketidaknyaman yang anda alami, kami senantiasa akan terus membantu anda.Kesalahan yang anda alami mungkin terjadi karena ada faktor-faktor yang mempengarui sehingga kami akan seger memperbaiki itu.",
          ),
          const SizedBox(
            height: 12,
          ),
          const CardInbox(
            title: "Kampiri Wajo",
            subtitle: "No. pesanan 9232322123",
            volume: "50 MT",
            titleAnswer: "Marketing belum memproses pesanan saya",
            titleCardAnswer: "Kampiri Wajo",
            subtitleCardAnswer: "No. 9232322123",
            volumeCardAnswer: "50 MT",
            contentAnswer:
                "Saya memiliki masalah dibagian proses pemesanan yang sangat lama.",
            answer:
                "Sebelumnya mohon maaf atas ketidaknyaman yang anda alami, kami senantiasa akan terus membantu anda.Kesalahan yang anda alami mungkin terjadi karena ada faktor-faktor yang mempengarui sehingga kami akan seger memperbaiki itu.",
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      );
    }

    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 48,
                ),
                Text(
                  'Inbox',
                  style: blackTextStyle.copyWith(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Tim kami akan membantu anda jika ada masalah terkait pemesanan aspal anda',
                  style: secondGreyTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                        child: InboxTab(
                      title: "Sedang Berjalan",
                      index: 0,
                      color: Colors.white,
                    )),
                    Expanded(
                        child: InboxTab(
                      title: "Riwayat",
                      index: 1,
                      color: Colors.white,
                    ))
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const CardInboxOngoing(
                  title: "Kampiri Wajo",
                  noPesanan: "9232322123",
                  status: "Disubmit",
                  content: "Marketing belum memproses pesanan anda",
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),

        //Noted: button inbox
        // Container(
        //   margin: const EdgeInsets.only(right: 24, bottom: 24),
        //   alignment: Alignment.bottomRight,
        //   child: GestureDetector(
        //     onTap: () {},
        //     child: Image.asset(
        //       "assets/icon_inbox.png",
        //       height: 48,
        //       width: 48,
        //     ),
        //   ),
        // )
      ],
    ));
  }
}
