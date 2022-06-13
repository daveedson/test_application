// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignUpViewModel extends GetxController {
  RxBool _showPassword = false.obs;
  var _enabled = false.obs;
  var _isLoading = false.obs;
  bool get showPassword => _showPassword.value;
  bool get isLoading => _isLoading.value;

  TextEditingController? emailController;
  TextEditingController? nameController;
  TextEditingController? passwordController;
  var greaterThan8 = false.obs;
  var containsNumber = false.obs;
  var containsSymbol = false.obs;
  var containsLetter = false.obs;
    final formKey = GlobalKey<FormState>();

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

    signUp(){
      if(formKey.currentState!.validate()){
        
      }
    }

}
