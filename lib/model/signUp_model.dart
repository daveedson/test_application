// ignore_for_file: file_names
import 'dart:convert';

class SignUpResponseModel {
  String? firstName;
  String? lastName;
  String? token;

  SignUpResponseModel({this.firstName, this.lastName, this.token});

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
        token: json['token'] ?? "",
        firstName: json["first_name"],
        lastName: json["last_name"]);
  }
}

class SignUpRequestModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? passsword;
  final String? confirmPassword;

  SignUpRequestModel({this.firstName,this.confirmPassword,this.email,this.lastName,this.passsword});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': passsword,
      'password_confirmation': confirmPassword
    };
    return map;
  }
}
