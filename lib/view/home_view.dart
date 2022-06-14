// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:test_app/utils/Ui_helper.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFBF8),
      floatingActionButton: FloatingActionButton(
          onPressed: () =>showActionButtomSheet(context),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Color(0xFFF9923B)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 15.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("images/baby.json"),
                  Text( 
                    "New borns should be shown here.\nAdd new born by clicking on\n Add the button",
                    style: TextStyle(color: Colors.grey,fontSize: 16.sp,fontWeight: FontWeight.w500),
                     textAlign: TextAlign.center,
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}

void showActionButtomSheet(context) {
 UiHelper.customBottomSheet(
    context: context,
    height: 348.h,
    child: Container(
       height: 400.h,
    ),
  );
}