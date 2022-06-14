// ignore_for_file: prefer_final_fields, unnecessary_null_comparison, avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/config/api_service.dart';
import 'package:test_app/config/services/local/implementation/local_cache_implementation.dart';
import 'package:test_app/model/login_model.dart';
import 'package:test_app/view/home_view.dart';

import '../utils/Ui_helper.dart';

class LoginViewModel extends GetxController {
  RxBool _showPassword = false.obs;
  GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  LocalCacheImplementation localCacheImplementation =
      LocalCacheImplementation();
  var _enabled = false.obs;
  var _isLoading = false.obs;
  bool get showPassword => _showPassword.value;
  bool get isLoading => _isLoading.value;

  set isLoading(bool state) {
    _isLoading.value = state;
  }

  String? email;
  String? password;

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

  login() async {
    if (loginformKey.currentState!.validate()) {
      isLoading = true;
      email = emailController!.text.trim();
      password = passwordController!.text.trim();
      LoginModel loginModel = LoginModel(
        email: email!,
        password: password!,
      );
      var loginModelData = loginModel.toJson();
      log("data:   $loginModelData");
      var response =
          await ApiService().post("api/v1/login", data: loginModelData);
      print(response);
      isLoading = false;
      var token = response['token'];
      if (response != null) {
        UiHelper.success("SignUp Successful");
        localCacheImplementation.setStringValue("Token", token);
        localCacheImplementation.setIntValue("UserId", response['user_id']);
        var userId = await localCacheImplementation.getIntValue("UserId");
        print(userId);

        Get.offAllNamed(HomeScreen.routeName);
      } else {
        UiHelper.errorMessage("Wrong email or password");
      }
    }
  }
}
