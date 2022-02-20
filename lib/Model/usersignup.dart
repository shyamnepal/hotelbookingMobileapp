class UserSignupModel {
  final firstName;
  final lastName;
  final email;
  final password;

  UserSignupModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  factory UserSignupModel.fromJson(Map<String, dynamic> json) {
    return UserSignupModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      };
}
