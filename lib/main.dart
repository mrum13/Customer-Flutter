import 'package:ats_customer/cubit/auth_cubit.dart';
import 'package:ats_customer/cubit/branch_cubit.dart';
import 'package:ats_customer/cubit/button_volume_cubit.dart';
import 'package:ats_customer/cubit/button_volume_selected_cubit.dart';
import 'package:ats_customer/cubit/card_switch_company_cubit.dart';
import 'package:ats_customer/cubit/contract_card_cubit.dart';
import 'package:ats_customer/cubit/data_company_switch_cubit.dart';
import 'package:ats_customer/cubit/home_cubit.dart';
import 'package:ats_customer/cubit/navbar_cubit.dart';
import 'package:ats_customer/cubit/order_po_cubit.dart';
import 'package:ats_customer/cubit/rating_cubit.dart';
import 'package:ats_customer/cubit/tab_inbox_cubit.dart';
import 'package:ats_customer/cubit/timer_cubit.dart';
import 'package:ats_customer/cubit/user_cubit.dart';
import 'package:ats_customer/cubit/user_type_cubit.dart';
import 'package:ats_customer/services/auth_services.dart';
import 'package:ats_customer/ui/pages/account_page.dart';
import 'package:ats_customer/ui/pages/activity_page.dart';
import 'package:ats_customer/ui/pages/contract_page.dart';
import 'package:ats_customer/ui/pages/detail_inbox_page.dart';
import 'package:ats_customer/ui/pages/detail_news_page.dart';
import 'package:ats_customer/ui/pages/edit_account_page.dart';
import 'package:ats_customer/ui/pages/help_page.dart';
import 'package:ats_customer/ui/pages/branch_list_page.dart';
import 'package:ats_customer/ui/pages/detail_order_page.dart';
import 'package:ats_customer/ui/pages/home_page.dart';
import 'package:ats_customer/ui/pages/call_admin.dart';
import 'package:ats_customer/ui/pages/inbox_page.dart';
import 'package:ats_customer/ui/pages/loading_add_company_page.dart';
import 'package:ats_customer/ui/pages/loading_login_page.dart';
import 'package:ats_customer/ui/pages/loading_regist_page.dart';
import 'package:ats_customer/ui/pages/login_page.dart';
import 'package:ats_customer/ui/pages/main_page.dart';
import 'package:ats_customer/ui/pages/notifications_page.dart';
import 'package:ats_customer/ui/pages/order_page.dart';
import 'package:ats_customer/ui/pages/otp_page.dart';
import 'package:ats_customer/ui/pages/rating_page.dart';
import 'package:ats_customer/ui/pages/register_page.dart';
import 'package:ats_customer/ui/pages/splash_page.dart';
import 'package:ats_customer/ui/pages/tracking_page.dart';
import 'package:ats_customer/ui/pages/user_guide_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => TimerCubit())),
        BlocProvider(create: ((context) => NavbarCubit())),
        BlocProvider(create: ((context) => ButtonVolumeCubit())),
        BlocProvider(create: ((context) => RatingCubit())),
        BlocProvider(create: ((context) => CardSwitchPerusahaanCubit())),
        BlocProvider(create: ((context) => AuthCubit())),
        BlocProvider(create: ((context) => UserCubit())),
        BlocProvider(create: ((context) => UserTypeCubit())),
        BlocProvider(create: ((context) => HomeCubit())),
        BlocProvider(create: ((context) => BranchCubit())),
        BlocProvider(create: ((context) => ContractCardCubit())),
        BlocProvider(create: ((context) => ButtonVolumeSelectedCubit())),
        BlocProvider(create: (((context) => OrderPoCubit()))),
        BlocProvider(create: (((context) => DataCompanySwitchCubit()))),
        BlocProvider(create: (((context) => TabInboxCubit()))),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const SplashPage(),
          'login': (context) => LoginPage(),
          'register': (context) => RegisterPage(),
          'call-admin': (context) => CallAdminPage(),
          'otp': (context) => const OtpPage(),
          'loading-login': (context) => const LoadingLoginPage(),
          'loading-regist': (context) => const LoadingRegistPage(),
          'main': (context) => const MainPage(),
          'home': (context) => HomePage(),
          'activity': (context) => const ActivityPage(),
          'order': (context) => const OrderPage(),
          'inbox': (context) => const InboxPage(),
          'account': (context) => const AccountPage(),
          'detail-order': (context) => const DetailOrderPage(),
          'help': (context) => const HelpPage(),
          'rating': (context) => const RatingPage(),
          'branch-list': (context) => const BranchListPage(),
          'edit-account': (context) => const EditAccountPage(),
          'notification': (context) => const NotificationsPage(),
          'tracking': ((context) => const TrackingPage()),
          'contract': ((context) => const ContractPage()),
          'detail-inbox': ((context) => const DetailInboxPage()),
          'loading-add-company': ((context) => const LoadingAddCompanyPage()),
          'user-guide': ((context) => UserguidePage()),
          'detail-news': ((context) => DetailNewsPage()),
        },
      ),
    );
  }
}
