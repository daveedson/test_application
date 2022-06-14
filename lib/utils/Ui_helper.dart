// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/utils/LoadingIndicator.dart';

class UiHelper{
 
  static void error(message,
      {String? title, String? optionText, VoidCallback? onOption}) {
    if (message == null || message.isEmpty) return;

    Widget dialog = Platform.isIOS
        ? CupertinoAlertDialog(
            title:  Text(title ?? "Error"), //Sisinene#1
            content:  Text(message),
            actions: <Widget>[
              CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("Okay"),
                  onPressed: () => Get.back()),
              if (optionText != null)
                CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text(optionText),
                    onPressed: () {
                      Get.back();
                      onOption!();
                    }),
            ],
          )
        : AlertDialog(
            title:  Text(title ?? "Error"),
            content:  Text(message),
            actions: [
                CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text("Okay"),
                    onPressed: () => Get.back()),
              ]);

    showCupertinoDialog(context: Get.context!, builder: (context) => dialog);
  }

   static void success(message, {String title = ""}) {
    Get.showSnackbar(GetBar(
      message: message,
      duration: Duration(seconds: 3),
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      borderRadius: 10,
      backgroundColor: Colors.green,
    ));
  }

  static void errorMessage(message, {String title = ""}) {
    Get.showSnackbar(GetBar(
      message: message,
      duration: Duration(seconds: 3),
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      borderRadius: 10,
      backgroundColor: Colors.red,
    ));
  }
  
  static showLoading(bool shouldShow) {
    if (shouldShow) {
      Get.dialog(LoadingIndicator(), barrierDismissible: false);
      return;
    }
    Get.back();
  }
  static Widget button(Widget child, VoidCallback onPressed,
      {bool loading = false,
      Widget? suffix,
      double height = 45,
      double width = double.infinity,
      Color color = const Color(0xff180066),
      Border? border,
      double borderRadius = 10}) {
    return Container(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: MaterialButton(
          color: color,
          elevation: 5,
          onPressed: onPressed,
          child: !loading
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    suffix == null
                        ? Container()
                        : SizedBox(
                            width: 24,
                          ),
                    child,
                    suffix == null ? Container() : suffix,
                  ],
                )
              : Container(
                  height: 23,
                  width: 23,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
        ),
      ),
    );
  }
}