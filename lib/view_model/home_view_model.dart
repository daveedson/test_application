// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/config/api_service.dart';
import 'package:test_app/config/services/local/implementation/local_cache_implementation.dart';
import 'package:test_app/model/create_new_born_model.dart';
import 'package:test_app/utils/Ui_helper.dart';

class HomeViewModel extends GetxController {
  String? name;
  String? gender;
  String? gestation;
  TextEditingController? childNameController;
  TextEditingController? genderController;
  LocalCacheImplementation localCacheImplementation =
      LocalCacheImplementation();
  @override
  void onInit() {
    childNameController = TextEditingController();
    genderController = TextEditingController();
    super.onInit();
  }

  createNewBorn() async {
    CreateNewBornModel newBorn = CreateNewBornModel(
      gender: gender!,
      name: name!,
      gestation: gestation!,
    );

    var newBornData = newBorn.toJson();
    log(newBornData.toString());
    var userToken = await localCacheImplementation.getStringValue("Token");

    var response = ApiService().post("api/v1/newborns",data: newBornData,header: {'Authorization': 'Bearer $userToken'});

    if(response != null){
        print("--New born Created Successfully");
    }else{
       UiHelper.errorMessage("Something went wrong");
    }
  }
}
