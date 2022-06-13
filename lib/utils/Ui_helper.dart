// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}