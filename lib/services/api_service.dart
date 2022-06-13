// ignore_for_file: unused_element, nullable_type_in_catch_clause, use_rethrow_when_possible, prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../utils/Ui_helper.dart';



class ApiService{
    final http.Client client;
    final bool showError;


    String baseUrl = "https://ubenwa-cat-api-stage.herokuapp.com"; 

  ApiService({http.Client? client,this.showError=true}):client = client??http.Client();


 Future<dynamic> post(String url, {Map<String, dynamic>? data, String? contentType}) async{
    print(baseUrl + url);
    var responseJson;
     try {
      final response = await client.post(Uri.parse(baseUrl + url),
          headers: {
            HttpHeaders.contentTypeHeader: contentType!,
          },
          body: json.encode(data));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }


  Future<dynamic> get(String url, {Map<String, dynamic>? queries}) async {
    print(url);
    var responseJson;
    try {
      final response = await client.get(Uri.parse(baseUrl + url), headers: {
        'Content-type': 'application/json',
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }











  dynamic _returnResponse(http.Response response) {
    try {
      return _getResponse(response);
    } on ApplicationException catch (e) {
      if ( showError) {
        UiHelper.error(e._message);
      }
      throw e;
    }
  }








  // this methods holds api's responses
dynamic _getResponse(http.Response response) {
    int code = response.statusCode;
    if (response.body.startsWith('{"status":"error"')) {
      // handle v1 fake 200 errors
      if (response.statusCode != 401) code = 400;
    }
    switch (code) {
      case 400:
        print('badddd');
        throw BadRequestException(
            json.decode(response.body.toString())['message']);
      case 401:
        //  AuthService.it.logout();
        throw InvalidTokenException(json.decode(response.body)['message']);
      case 403:
        throw UnauthorisedException(json.decode(response.body)['message']);
      case 500:
      default:
        if (!isResponseOk(response.statusCode)) {
          throw FetchDataException('\n StatusCode : ${response.statusCode}.'
              '\n Response: ${response.body.toString()}');
        }
        var responseJson = json.decode(response.body.toString());
        return responseJson;
    }
  }


bool isResponseOk(int statusCode) {
    return statusCode >= 200 && statusCode <= 299;
  }
 }

























//this class handles all Applications exceptions on the test app
class ApplicationException implements Exception {
  final _message;
  final _prefix;

  ApplicationException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends ApplicationException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends ApplicationException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends ApplicationException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidTokenException extends ApplicationException {
  InvalidTokenException([message]) : super(message, "Invalid Token: ");
}

class InvalidInputException extends ApplicationException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}