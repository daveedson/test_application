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
  var _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  set isLoading(bool state) {
    _isLoading.value = state;
  }

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
    try{
isLoading = true;
    name = childNameController!.text.trim();
    gender = genderController!.text.trim();
    gestation = DateTime.now().toIso8601String();

    CreateNewBornModel newBorn = CreateNewBornModel(
      gender: gender!,
      name: name!,
      gestation: gestation!,
    );

    name = childNameController!.text.trim();
    gender = genderController!.text.trim();
    gestation = DateTime.now().toIso8601String();

    var newBornData = newBorn.toJson();
    log(newBornData.toString());
    var userToken = await localCacheImplementation.getStringValue("Token");

    var response = await ApiService().post("api/v1/newborns",
        data: newBornData, header: {'Authorization': 'Bearer $userToken'});
    isLoading = false;
    if (response != null) {
      print("--New born Created Successfully");
      print(response);
    } else {
      UiHelper.errorMessage("Something went wrong");
    }
    }catch(e){
        log(e.toString());
         UiHelper.errorMessage("Something went wrong");
    }
    
  }
}
