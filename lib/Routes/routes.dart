import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  //initialRoute
  static const splashScreen = Routes.splashScreen;
  static const onBoardingScreen = Routes.loginScreen;

  //getPages
  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const Scaffold(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const Scaffold(),
      bindings: [],
    ),
  ];
}

class Routes {
  static const splashScreen = '/splashScreen';
  static const loginScreen = '/loginScreen';
}
