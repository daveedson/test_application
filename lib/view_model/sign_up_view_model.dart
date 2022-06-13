// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignUpViewModel extends GetxController{
   RxBool _showPassword = false.obs;
  var _enabled = false.obs;
  var _isLoading = false.obs;
  bool get showPassword => _showPassword.value;
  bool get isLoading => _isLoading.value;
  
  TextEditingController? emailController;
  TextEditingController? nameController;
  TextEditingController? passwordController;

  @override
  void onInit() {
    emailController = TextEditingController();
     nameController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  set showPassword(bool state) => _showPassword.value = state;
  bool get enambled => _enabled.value;
}