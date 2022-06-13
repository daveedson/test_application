// ignore_for_file: prefer_const_constructors

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_app/view/home_view.dart';
import 'package:test_app/view/login_view.dart';
import 'package:test_app/view/sign_up_view.dart';
import 'package:test_app/view/splash_screen_view.dart';

class AppRouter{
    static List<GetPage> routes = [
       GetPage(name: SplashScreen.routeName, page: () => SplashScreen()),
       GetPage(name: SignUpView.routeName, page: () => SignUpView()),
       GetPage(name:LogingView.routeName, page: () => LogingView()),
       GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),
    ];
}