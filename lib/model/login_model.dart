class LoginModel {
  
  final String email;
  final String password;

  LoginModel({required this.email, required this.password});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "email": email,
      "password": password,
    };
    return map;
  }
}
