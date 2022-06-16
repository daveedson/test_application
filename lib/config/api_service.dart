// ignore_for_file: override_on_non_overriding_member, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:test_app/utils/Ui_helper.dart';

class ApiService {
  String baseUrl = "https://ubenwa-cat-api-stage.herokuapp.com/";

  Future<dynamic> get(String url,String token) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(baseUrl + url),
        headers: {
          'Content-Type': "application/json",
      "Authorization": "Bearer  $token"
        }
        );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  //Map<String ,String>? header
  Future<dynamic> post(String url, {Map<String, dynamic>? data}) async {
    dynamic responseJson;
    log(baseUrl + url);
    try {
      final response = await http.post(
        Uri.parse(baseUrl + url),
        //headers: header!,
        body: data,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  //check the postAuth
  Future<dynamic> postAuth(String url,{Map<String, dynamic>? data, String? token}) async {
    Map<String, String> header = {
      'Content-Type': "application/vnd.api+json",
      "Authorization": "Bearer  $token"
    };

    dynamic responseJson;
    log(baseUrl + url);

    try {
    final response = await http.post(
      Uri.parse(baseUrl + url),
      body: json.encode(data),
      headers: header,
    );
    log(response.statusCode.toString());

    //responseJson = _returnResponse(response);
    return response;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  //  responseJson;
  }


  

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        log("---SuccessFul--- ");
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 201:  
        log("---SuccessFul--- ");
        var responseJson = response.body.toString();
        return responseJson;
      case 400:
        log("Bad request i fucked up");
        break;
      case 401:
        log("Unauthorized ");
        break;
      case 403:
        log("Forbidden you dont have access");
        break;
      case 404:
        log("Not Found");
        break;
      case 500:
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
