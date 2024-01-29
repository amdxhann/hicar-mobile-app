import 'package:get/get.dart';
import 'package:rentcar/pages/driverdetails.dart';
import 'package:rentcar/pages/detailcars.dart';

import 'package:rentcar/pages/explore.dart';
import 'package:rentcar/pages/history.dart';
import 'package:rentcar/pages/login_screen.dart';
import 'package:rentcar/pages/navigasi.dart';
import 'package:rentcar/pages/homepage.dart';
import 'package:rentcar/pages/profile.dart';
import 'package:rentcar/pages/personal_detail.dart';
import 'package:rentcar/pages/splash.dart';
import 'package:rentcar/pages/registration_screen.dart';
import 'package:rentcar/pages/aboutUs.dart';
import 'package:rentcar/pages/faq.dart';
import '../pages/adminControl/entity/User/editUser.dart';
import '../pages/adminControl/entity/cars/editCars.dart';
import '../pages/adminControl/setPageAdmin.dart';
import '../pages/adminControl/entity/cars/addCars.dart';
import 'routes_name.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RouteName.homepage,
      page: () => Homepage(),
    ),
    GetPage(
      name: RouteName.aboutUs,
      page: () => aboutUs(),
    ),
    GetPage(
      name: RouteName.detailCars,
      page: () => detailcars(),
    ),
    GetPage(
      name: RouteName.driverDetails,
      page: () => driverdetails(),
    ),
   
    GetPage(
      name: RouteName.explore,
      page: () => explore(),
    ),
    GetPage(
      name: RouteName.history,
      page: () => history(),
    ),
    GetPage(
      name: RouteName.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RouteName.navigasi,
      page: () => navigasi(),
    ),
    GetPage(
      name: RouteName.personalDetail,
      page: () => personalDetail(),
    ),
    GetPage(
      name: RouteName.profile,
      page: () => profile(),
    ),
    GetPage(
      name: RouteName.registration,
      page: () => RegistrationScreen(),
    ),
    GetPage(
      name: RouteName.splash,
      page: () => splash(),
    ),
    GetPage(
      name: RouteName.adminControl,
      page: () => adminControl(),
    ),
    GetPage(
      name: RouteName.editUser,
      page: () => editUser(),
    ),
    GetPage(
      name: RouteName.AddCars,
      page: () => AddCars(),
    ),
    GetPage(
      name: RouteName.EditCars,
      page: () => EditCars(),
    ),
    GetPage(
      name: RouteName.Faq,
      page: () => Faq(),
    ),
  ];
}
