class AuthParamModel {
  final String username;
  final String email;
  final String password;
  final String password2;
  final String firstName;
  final String lastName;
  final int initialExperience;
  final int initialMoney;

  AuthParamModel({
    required this.username,
    required this.email,
    required this.password,
    required this.password2,
    required this.firstName,
    required this.lastName,
    this.initialExperience = 0,
    this.initialMoney = 0,
  });
}
