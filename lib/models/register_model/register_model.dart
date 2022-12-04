class RegisterModel {
  final String name;
  final String email;
  final String handphone;
  final String password;
  final String rePassword;

  RegisterModel(
      {required this.email,
      required this.handphone,
      required this.name,
      required this.password,
      required this.rePassword});

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "handphone": handphone,
        "password": password,
        "password_confirmation": rePassword
      };
}
