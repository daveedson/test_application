// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:test_app/utils/Ui_helper.dart';
import 'package:test_app/view_model/home_view_model.dart';

import '../animations/bottom_up_animations.dart';
import '../animations/slide_left_animation.dart';

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
      floatingActionButton: Container(
        decoration: BoxDecoration(
       gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        colors: [
        Colors.lightBlueAccent,
        Colors.yellow.shade700,
        ],
    ),
    shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
            onPressed: () => showActionButtomSheet(context),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Colors.transparent),
      ),
      body: GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
        builder: (controller) {
          return Padding(
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
                        "New borns should be shown here.\nAdd a new born by clicking on\n Add the button",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
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
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Create new born",
              style: TextStyle(
                  color: Color(0xFFF9923B),
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp),
            ),
          ),
          SizedBox(height: 32.h),
          BottomUpAnimaitons(
            delay: 0.2,
            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15.r, vertical: 9.r),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none),
                  filled: true,
                  hintStyle: TextStyle(color: Color(0xff88879C)),
                  hintText: "Child's name",
                  fillColor: Color(0XFFE6E6E6)),
            ),
          ),
          SizedBox(height: 20.h),
          BottomUpAnimaitons(
            delay: 0.2,
            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15.r, vertical: 9.r),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none),
                  filled: true,
                  hintStyle: TextStyle(color: Color(0xff88879C)),
                  hintText: "Gender",
                  fillColor: Color(0XFFE6E6E6)),
            ),
          ),
           SizedBox(height: 30.h),
           SlideInLeftAnimation(
            delay: 0.2,
            child: UiHelper.button(
                Text(
                  "Create",
                  style: TextStyle(color: Colors.white),
                ),
                () {},
               // loading: controller.isLoading,
                color: Color(0xFFF9923B)),
          )
        ],
      )),
    ),
  );
}
