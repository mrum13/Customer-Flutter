import 'package:ats_customer/cubit/navbar_cubit.dart';
import 'package:ats_customer/shared/theme.dart';
import 'package:ats_customer/ui/pages/account_page.dart';
import 'package:ats_customer/ui/pages/activity_page.dart';
import 'package:ats_customer/ui/pages/home_page.dart';
import 'package:ats_customer/ui/pages/inbox_page.dart';
import 'package:ats_customer/ui/pages/order_page.dart';
import 'package:ats_customer/ui/widgets/custom_bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return ActivityPage();
        case 2:
          return OrderPage();
        case 3:
          return InboxPage();
        case 4:
          return AccountPage();
        default:
          return HomePage();
      }
      return HomePage();
    }

    return BlocBuilder<NavbarCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
            body: Column(
          children: [
            Expanded(child: buildContent(currentIndex)),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 64,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                ),
                child: Container(
                  decoration:
                      BoxDecoration(color: kWhiteColor, boxShadow: const [
                    // BoxShadow(
                    //     blurStyle: BlurStyle.outer,
                    //     blurRadius: 2.0,
                    //     spreadRadius: 0.1,
                    //     offset: Offset(0, -0.1)
                    // )
                  ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      CustomBottomNavigationItem(
                        index: 0,
                        imageNavbar0: 'assets/icon_nav_home_0.png',
                        imageNavbar1: 'assets/icon_nav_home_1.png',
                        titleNavbar: 'Home',
                      ),
                      // ignore: prefer_const_constructors
                      CustomBottomNavigationItem(
                        index: 1,
                        imageNavbar0: 'assets/icon_nav_activity_0.png',
                        imageNavbar1: 'assets/icon_nav_activity_1.png',
                        titleNavbar: 'Aktifitas',
                      ),
                      // ignore: prefer_const_constructors
                      CustomBottomNavigationItem(
                        index: 2,
                        imageNavbar0: 'assets/icon_nav_order_0.png',
                        imageNavbar1: 'assets/icon_nav_order_1.png',
                        titleNavbar: 'Order',
                      ),
                      // ignore: prefer_const_constructors
                      CustomBottomNavigationItem(
                        index: 3,
                        imageNavbar0: 'assets/icon_nav_inbox_0.png',
                        imageNavbar1: 'assets/icon_nav_inbox_1.png',
                        titleNavbar: 'Inbox',
                      ),
                      // ignore: prefer_const_constructors
                      CustomBottomNavigationItem(
                        index: 4,
                        imageNavbar0: 'assets/icon_nav_account_0.png',
                        imageNavbar1: 'assets/icon_nav_account_1.png',
                        titleNavbar: 'Akun',
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
      },
    );
  }
}
