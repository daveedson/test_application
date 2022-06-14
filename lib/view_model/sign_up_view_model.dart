// ignore_for_file: prefer_final_fields

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:test_app/config/api_service.dart';
import 'package:test_app/model/signUp_model.dart';
import 'package:test_app/utils/Ui_helper.dart';

class SignUpViewModel extends GetxController {
  RxBool _showPassword = false.obs;
  var _enabled = false.obs;
  var _isLoading = false.obs;
  bool get showPassword => _showPassword.value;
  bool get isLoading => _isLoading.value;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;

  TextEditingController? emailController;
  TextEditingController? nameController;
  TextEditingController? passwordController;

  var greaterThan8 = false.obs;
  var containsNumber = false.obs;
  var containsSymbol = false.obs;
  var containsLetter = false.obs;

  GlobalKey<FormState> singUpform = GlobalKey<FormState>();

  @override
  void onInit() {
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  set showPassword(bool state) => _showPassword.value = state;
  bool get enambled => _enabled.value;

  validatePassword(String s) {
    print("Callling here with $s");

    if (s.length >= 8) {
      print("$s is greater than 8");
      greaterThan8.value = true;
    } else {
      greaterThan8.value = false;
    }
    if (s.contains(new RegExp(r'[A-Za-z]'))) {
      print("Contains Letter");
      containsLetter.value = true;
    } else {
      containsLetter.value = false;
    }
    if (s.contains(new RegExp(r'[0-9]'))) {
      print("Contains numbers ");

      containsNumber.value = true;
    } else {
      containsNumber.value = false;
    }
    if (s.contains(new RegExp(r'[!@#$%^&*(),?":{}|<>]'))) {
      print("Contains special characters");

      containsSymbol.value = true;
    } else {
      containsSymbol.value = false;
    }
  }

//   signUp() async {
//  //   try {
//     //  if (formKey.currentState!.validate()) {

//         UiHelper.showLoading(true);
//         var signUpResponse = await AuthRepositoryImplementation.instance.signUp(firstName: "David", lastName: "Onoh", email: "DavidOnoh@gmail.com", password: "Tianam12@", confirmPassword:"Tianam12@");
//         UiHelper.showLoading(false);
//     //   } else {
//     //     return;
//     //   }
//     // // } catch (e) {
//     //   UiHelper.error(e.toString());
//     // }
//   }

  signUp() async {
    firstName = nameController!.text.trim();
    email = emailController!.text.trim();
    password = passwordController!.text.trim();
    confirmPassword = passwordController!.text.trim();
    lastName = "";

    SignUpRequestModel signUpRequestModel = SignUpRequestModel(
      firstName: firstName,
      lastName: lastName,
      email: email,
      passsword: password,
      confirmPassword: confirmPassword,
    );
    var signUpRequestModelData = signUpRequestModel.toJson();
    log("data:   $signUpRequestModelData");
    var response = await ApiService().post("api/v1/signup", data: signUpRequestModelData);
   

    print("this is the response from viewModel   $response");
  }
}
