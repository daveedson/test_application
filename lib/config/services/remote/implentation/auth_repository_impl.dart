// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:test_app/config/services/api_service.dart';
import 'package:test_app/config/services/local/implementation/local_cache_implementation.dart';
import 'package:test_app/config/services/remote/repositories/auth_repository.dart';
import 'package:test_app/model/signUp_model.dart';

import '../../../../utils/Ui_helper.dart';

class AuthRepositoryImplementation implements AuthRepository {
  ApiService apiService = ApiService(showError: true);
  LocalCacheImplementation localCacheImplementation = LocalCacheImplementation();
  @override
   login(String email, String password)async {
     try{
       var response = await apiService.post(url: "/api/v1/login",contentType: "application/json",data: {"email":email,"password":password});
        if(response["user_info"]["is_active_listening"] == true){
          print("--Login in Success---");
          UiHelper.success("Login Successful");
          print(response["user_info"]);
        }else{
          print(response);
          UiHelper.errorMessage("Something went wrong");
        }
     }catch(e){
      log("${e.toString()} while Signin in");
      UiHelper.error(e.toString());
     }
  }

  @override
  signUp(SignUpModel signUpModel) async {
    Map<String, dynamic> data = {
      "first_name": signUpModel.firstName,
      "last_name": signUpModel.lastName,
      "email": signUpModel.email,
      "password": signUpModel.password,
      "password_confirmation": signUpModel.confirmPassword,
    };

    try {
      var response = await apiService.post(
        url: "/api/v1/signup",
        contentType: "application/x-www-form-urlencoded",
        data: data,
      );

      print(response);

      if (response["statuscode"] == 200) {
        await localCacheImplementation.saveToken("Token", response["token"]);
          UiHelper.success("Sign up successful");
          print(response["user_info"]);
      }else{
           UiHelper.errorMessage("Something went wrong");
      }
    } catch (e) {
      log("${e.toString()} while Signin up ");
      UiHelper.error(e.toString());
    }
  }
}
