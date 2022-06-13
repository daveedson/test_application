// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/animations/fade_in_animation.dart';
import 'package:test_app/view/login_view.dart';

class SplashScreen extends StatefulWidget {
   static String routeName = "/splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
 Timer(
            Duration(seconds: 4),
                () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => LogingView())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFE5D6),Color(0xFF85D3FF)],
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: FadeInAnimations(
              delay: 2.0,
              child: Text("Test App",style: TextStyle(color: Color(0xFF333E63),fontWeight: FontWeight.w700,fontSize: 30.sp),)),
          ),
        ));
  }
}
