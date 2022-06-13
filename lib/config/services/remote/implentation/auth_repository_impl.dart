import 'package:test_app/config/services/remote/repositories/auth_repository.dart';

class AuthRepositoryImplementation implements AuthRepository{
  @override
  Future login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future signUp(String firstName, String lastName, String email, String password, String confirmPassword) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}