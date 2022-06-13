// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/animations/bottom_up_animations.dart';
import 'package:test_app/animations/slide_left_animation.dart';

import '../animations/slide_in_right.dart';

class SignUpView extends StatefulWidget {
   static String routeName = "/signup";
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SlideInLeftAnimation(
                        delay: 0.3,
                        child: Text(
                          "SignUp",
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
                      child: Text("Name",
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
                      child: Container(
                        height: 38.h,
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 17.r, vertical: 9.r),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none),
                              filled: true,
                              hintStyle: TextStyle(color: Color(0xff88879C)),
                              hintText: "jane Doe",
                              fillColor: Color(0XFFE6E6E6)),
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
                      child: Container(
                        height: 38.h,
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 17.r, vertical: 9.r),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none),
                              filled: true,
                              hintStyle: TextStyle(color: Color(0xff88879C)),
                              hintText: "example@email.com",
                              fillColor: Color(0XFFE6E6E6)),
                        ),
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
                      child: Container(
                        height: 38.h,
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 17.r, vertical: 9.r),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none),
                              filled: true,
                              hintStyle: TextStyle(color: Color(0xff88879C)),
                              hintText: "password",
                              suffixIcon: GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  )),
                              fillColor: Color(0XFFE6E6E6)),
                        ),
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
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Sign Up'),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFF9923B),
                              // onSurface: Color(0xFFF9923B),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12), // <-- Radius
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    BottomUpAnimaitons(
                      
                      delay: 0.3,
                      child: Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 28.sp),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Dont',
                                  style: TextStyle(color: Color(0xff88879C))),
                              TextSpan(text: ' have an account? ',style: TextStyle(color: Color(0xff88879C))),
                              TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    color: Color(0xFFF9923B),
                                      decoration: TextDecoration.underline,))
                            ],
                          ),
                          textScaleFactor: 0.5,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
