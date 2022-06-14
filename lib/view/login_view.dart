// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_app/animations/bottom_up_animations.dart';
import 'package:test_app/animations/slide_left_animation.dart';
import 'package:test_app/utils/Ui_helper.dart';
import 'package:test_app/view/sign_up_view.dart';
import 'package:test_app/view_model/login_view_model.dart';

import '../animations/slide_in_right.dart';


class LogingView extends StatefulWidget {
  static String routeName = "/login";
  const LogingView({Key? key}) : super(key: key);
  

  @override
  State<LogingView> createState() => _LogingViewState();
}

class _LogingViewState extends State<LogingView> {
   
      LoginViewModel lcontroller = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFBF8),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(height: 116.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Test App",
                style: TextStyle(
                    color: Color(0xFF333E63),
                    fontWeight: FontWeight.w700,
                    fontSize: 30.sp),
              ),
            ),
            SizedBox(
              height: 86.h,
            ),
            Container(
              height: 417.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.r, vertical: 20.r),
                child: GetX<LoginViewModel>(builder: (loginController) {
                     print(loginController.enambled);
                  return Form(
                    key: loginController.loginformKey,
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SlideInLeftAnimation(
                            delay: 0.3,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Color(0xFF333E63),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22.sp),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        BottomUpAnimaitons(
                          delay: 0.3,
                          child: Text("Email",
                              style: TextStyle(
                                  color: Color(0xFF333E63),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp)),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        BottomUpAnimaitons(
                          delay: 0.3,
                          child: TextFormField(
                            controller: loginController.emailController,
                           validator:(String? s) {
                              if (loginController.emailController!.text.isEmpty) {
                                return "email cannot be empty";
                              }
                              return null;
                            }, 
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15.r, vertical: 9.r),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none),
                                filled: true,
                                hintStyle:
                                    TextStyle(color: Color(0xff88879C)),
                                hintText: "example@gmail.com",
                                fillColor: Color(0XFFE6E6E6)),
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        BottomUpAnimaitons(
                          delay: 0.3,
                          child: Text("Password",
                              style: TextStyle(
                                  color: Color(0xFF333E63),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp)),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        BottomUpAnimaitons(
                          delay: 0.3,
                          child: TextFormField(
                            validator:(String? s) {
                              if (loginController.emailController!.text.isEmpty) {
                                return "password cannot be empty";
                              }
                              return null;
                            }, 
                             enabled: !loginController.isLoading,
                            obscureText: !loginController.showPassword,
                            controller:  loginController.passwordController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 17.r, vertical: 9.r),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none),
                                filled: true,
                                hintStyle:
                                    TextStyle(color: Color(0xff88879C)),
                                hintText: "password",
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                  
                                    loginController.showPassword =
                                            !loginController.showPassword;
                                    },
                                    child: Icon(
                                      loginController.showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      color: Colors.grey,
                                    )),
                                fillColor: Color(0XFFE6E6E6)),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SlideInRightAnimation(
                          delay: 0.3,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "forgot password?",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xFFF9923B),
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                        SizedBox(
                          height: 37.h,
                        ),
                        BottomUpAnimaitons(
                          delay: 0.3,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: double.infinity,
                              height: 38.h,
                              child: UiHelper.button(Text("Log in",style: TextStyle(color: Colors.white),), () {
                                 loginController.login();
                                  },
                                      loading: loginController.isLoading,
                                      color: Color(0xFFF9923B))
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        BottomUpAnimaitons(
                          delay: 0.3,
                          child: Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 28.sp),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Dont',
                                      style:
                                          TextStyle(color: Color(0xff88879C))),
                                  TextSpan(
                                      text: ' have an account? ',
                                      style:
                                          TextStyle(color: Color(0xff88879C))),
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () =>
                                            Get.toNamed(SignUpView.routeName),
                                      text: 'SignUp',
                                      style: TextStyle(
                                        color: Color(0xFFF9923B),
                                        decoration: TextDecoration.underline,
                                      ))
                                ],
                              ),
                              textScaleFactor: 0.5,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

validatePassword1(String value) {
    if (value.isEmpty) {
      return 'Please enter a valid password';
    }
    if (value.length < 8) {
      return 'Password cannot be less than 8 characters';
    }
    return null;
  }

  
}


