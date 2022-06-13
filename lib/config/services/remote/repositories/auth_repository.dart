import 'package:test_app/model/signUp_model.dart';

abstract class AuthRepository{
  Future<dynamic> login(String email, String password);
  Future<dynamic> signUp(SignUpModel signUpModel);
}