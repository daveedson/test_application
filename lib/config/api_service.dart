// ignore_for_file: override_on_non_overriding_member, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:test_app/utils/Ui_helper.dart';

class ApiService {
  String baseUrl = "https://ubenwa-cat-api-stage.herokuapp.com/";

  Future<dynamic> get(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? data}) async {
    dynamic responseJson;
    log(baseUrl + url);
    try {
      final response = await http.post(
        Uri.parse(baseUrl + url),
        body: data,
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }


  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      log("---SuccessFul--- ");
        dynamic responseJson = jsonDecode(response.body);

        return responseJson;
      
      case 400:
        log("Bad request i fucked up");
        UiHelper.errorMessage("Something went wrong");
        break;
      case 401:
       UiHelper.errorMessage("Something went wrong");
       log("Unauthorized ");
        break;
      case 403:
        UiHelper.errorMessage("Something went wrong");
        log("Forbidden you dont have access");
        break;
      case 404:
        UiHelper.errorMessage("Something went wrong");
        log("Not Found");
        break;
      case 500:
       UiHelper.errorMessage("Something went wrong");
        log("Server error");
    }
  }
}

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised Request: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
