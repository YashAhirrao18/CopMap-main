import 'package:flutter/material.dart';
import 'package:yash_s_application3/presentation/splash_screen/splash_screen.dart';
import 'package:yash_s_application3/presentation/login_screen/login_screen.dart';
import 'package:yash_s_application3/presentation/signup_screen/signup_screen.dart';
import 'package:yash_s_application3/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:yash_s_application3/presentation/dr_list_screen/dr_list_screen.dart';
import 'package:yash_s_application3/presentation/dr_details_screen/dr_details_screen.dart';
import 'package:yash_s_application3/presentation/book_an_appointment_screen/book_an_appointment_screen.dart';
import 'package:yash_s_application3/presentation/chat_screen/chat_screen.dart';
import 'package:yash_s_application3/presentation/settigns_screen/settigns_screen.dart';
import 'package:yash_s_application3/presentation/pharmacy_screen/pharmacy_screen.dart';
import 'package:yash_s_application3/presentation/drug_details_screen/drug_details_screen.dart';
import 'package:yash_s_application3/presentation/article_screen/article_screen.dart';
import 'package:yash_s_application3/presentation/cart_screen/cart_screen.dart';
import 'package:yash_s_application3/presentation/ambulance_screen/ambulance_screen.dart';
import 'package:yash_s_application3/presentation/schedule_tab_container_screen/schedule_tab_container_screen.dart';
import 'package:yash_s_application3/presentation/message_tab_container_screen/message_tab_container_screen.dart';
import 'package:yash_s_application3/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:yash_s_application3/presentation/view_bandobast/view_bandobast.dart';

//imports for all the station related
import 'package:yash_s_application3/presentation/stationscreens/station_login_screen/station_login_screen.dart';
import 'package:yash_s_application3/presentation/stationscreens/station_dashboard_screen/station_dashboard_screen.dart';
import 'package:yash_s_application3/presentation/stationscreens/station_create_screen/station_create_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String signupScreen = '/signup_screen';

  static const String dashboardScreen = '/dashboard_screen';

  static const String drListScreen = '/dr_list_screen';

  static const String drDetailsScreen = '/dr_details_screen';

  static const String bookAnAppointmentScreen = '/book_an_appointment_screen';

  static const String chatScreen = '/chat_screen';

  static const String settignsScreen = '/settigns_screen';

  static const String pharmacyScreen = '/pharmacy_screen';

  static const String drugDetailsScreen = '/drug_details_screen';

  static const String articleScreen = '/article_screen';

  static const String cartScreen = '/cart_screen';

  static const String ambulanceScreen = '/ambulance_screen';

  static const String schedulePage = '/schedule_page';

  static const String scheduleTabContainerScreen =
      '/schedule_tab_container_screen';

  static const String messagePage = '/message_page';

  static const String messageTabContainerScreen =
      '/message_tab_container_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String viewBandobastScreen = '/view_bandobast';

  //app routes for station related

  static const String stationLoginScreen = '/station_login_screen';
  static const String stationDashboardScreen = '/station_dashboard_screen';
  static const String stationCreateScreen = '/station_create_screen';

  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    splashScreen: (context) => SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    signupScreen: (context) => SignupScreen(),
    dashboardScreen: (context) => DashboardScreen(),
    drListScreen: (context) => DrListScreen(),
    drDetailsScreen: (context) => DrDetailsScreen(),
    bookAnAppointmentScreen: (context) => BookAnAppointmentScreen(),
    chatScreen: (context) => ChatScreen(),
    settignsScreen: (context) => SettignsScreen(),
    pharmacyScreen: (context) => PharmacyScreen(),
    drugDetailsScreen: (context) => DrugDetailsScreen(),
    articleScreen: (context) => ArticleScreen(),
    cartScreen: (context) => CartScreen(),
    ambulanceScreen: (context) => AmbulanceScreen(),
    scheduleTabContainerScreen: (context) => ScheduleTabContainerScreen(),
    messageTabContainerScreen: (context) => MessageTabContainerScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    viewBandobastScreen: (context) => ViewBandobastScreen(),

    //station related routes
    stationDashboardScreen: (context) => StationDashboardScreen(),
    stationLoginScreen: (context) => StationLoginScreen(),
    stationCreateScreen: (context) => StationCreateScreen()
  };
}
