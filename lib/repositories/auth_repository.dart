abstract class AuthRepository{
  Future<dynamic> login(String email, String password);
  Future<dynamic> signUp(String firstName,String lastName,String email,String password,String confirmPassword);
}