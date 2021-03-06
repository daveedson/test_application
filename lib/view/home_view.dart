// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:lottie/lottie.dart';
import 'package:test_app/model/api_response.dart';
import 'package:test_app/utils/Ui_helper.dart';
import 'package:test_app/utils/cardView.dart';
import 'package:test_app/view/splash_screen_view.dart';
import 'package:test_app/view_model/login_view_model.dart';

import '../animations/bottom_up_animations.dart';
import '../animations/slide_left_animation.dart';
import '../view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 HomeViewModel hcontroller = Get.put(HomeViewModel());
   LoginViewModel lcontroller = Get.put(LoginViewModel());
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
        Colors.blue,
        Colors.yellow.shade700,
        ],
    ),
    shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
            onPressed: (){
       showActionButtomSheet(context);

            } ,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Colors.transparent),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 15.r),
        child: GetBuilder<HomeViewModel>(
          builder: (hController) {
            return Column(
             // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50.h),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.yellow.shade700,
                      child: Center(child: Icon(Icons.person,color:Colors.grey))),
                    SizedBox(width:10.w),
                    Text("Hi, Good Morning ??????",style:TextStyle(fontSize:17.sp,fontWeight: FontWeight.w700))
                  ],
                ),
                Expanded(
                  child: hcontroller.newBornss.status == Status.LOADING?   Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset("images/baby.json"),
                      Text(
                        "New borns should be shown here.\nAdd a new born by clicking on the\n Add button",
                        style: TextStyle(
                            color: Colors.grey,           
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ): Align(
                      alignment: Alignment.topCenter,
                      child: ListView.builder(
                       reverse: true,
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          itemCount:hcontroller.newBornss.data!.newBornResults.length,
                          itemBuilder: ((context, index) {
                            return NotesCardView(
                              noteText: hController.newBornss.data!.newBornResults[index].gestation,
                              noteHearder:hController.newBornss.data!.newBornResults[index].name,
                                  
                              onTap: () async {
                                //onclick  of each item in the list this data is assinged to the new variable
                              
                              },
                            );
                          })),
                    ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}

void showActionButtomSheet(context) {
  UiHelper.customBottomSheet(
    context: context,
    height: 348.h,
    child: GetBuilder<HomeViewModel>(
      init:HomeViewModel(),
      builder: (controller) {
        return Container(
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
                  controller:controller.childNameController,
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
                  controller: controller.genderController,
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
                      style: TextStyle(color: Colors.white) ),
                      
                    () {
                    //  controller.createNewBorn();
                    controller.getNewBorns();
                    },
                    loading: controller.isLoading,
                    color: Color(0xFFF9923B)),
              )
            ],
          )),
        );
      }
    ),
  );
}
