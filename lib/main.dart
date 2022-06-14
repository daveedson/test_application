// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_app/utils/app_router.dart';
import 'package:test_app/view/home_view.dart';
import 'package:test_app/view/login_view.dart';
import 'package:test_app/view/sign_up_view.dart';
import 'package:test_app/view/splash_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 823),
      builder: (BuildContext context, Widget? child)=> GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test App',
        theme: ThemeData(
          primaryColor: Color(0xFFFFFBF8),
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomeScreen.routeName,
        getPages: AppRouter.routes,
       
      ),
    );
  }
}

