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
  String? personName;
  String? gestation;
  var _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  RxList<dynamic> names = [].obs;


  set isLoading(bool state) {
    _isLoading.value = state;
  }

  TextEditingController? childNameController;
  TextEditingController? genderController;
  LocalCacheImplementation localCacheImplementation = LocalCacheImplementation();
  @override
  void onInit() {
    childNameController = TextEditingController();
    genderController = TextEditingController();
     getUsername();
    super.onInit();
  }



  getUsername()async{
   personName =  await LocalCacheImplementation().getStringValue("name");
   print(personName);
   return personName;
  }

  createNewBorn() async {
    try{
    isLoading = true;
    name = "john";
    gender = "male";
    gestation = DateTime.now().toIso8601String();

    CreateNewBornModel newBorn = CreateNewBornModel(
      gender: gender!,
      name: name!,
      gestation: gestation!,
    );
    

  //   name = childNameController!.text.trim();
  //   gender = genderController!.text.trim();
  //  gestation = DateTime.now().toIso8601String();
  

    var newBornData = newBorn.toJson();
    log(newBornData.toString());
    var userToken = await localCacheImplementation.getStringValue("Token");
    print(userToken);
    var response = await ApiService().postAuth("api/v1/newborns",data: newBornData,token: userToken);
     isLoading = false;
    print(response);
   
    if (response != null) {
      print("--New born Created Successfully--");
      names.add(name);
      
      print(names);
      // name = "";
      // gender = "";
      // childNameController!.clear();
      // genderController!.clear();
      
       UiHelper.success("New born created successfully");
     
   
    } else {
      UiHelper.errorMessage("Something went wrong");
    }
    update();
    }catch(e){
        log(e.toString());
         UiHelper.errorMessage("Something went wrong");
    }
    
  }
}
