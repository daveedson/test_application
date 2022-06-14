// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../utils/Ui_helper.dart';

class LoginViewModel extends GetxController {
  RxBool _showPassword = false.obs;
    GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
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
  TextEditingController? passwordController;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  set showPassword(bool state) => _showPassword.value = state;
  bool get enambled => _enabled.value;
  
   
  }
