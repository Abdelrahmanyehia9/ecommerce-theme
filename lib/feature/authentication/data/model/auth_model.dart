class AuthModel {
  final String username;

  final String? email;

  final String password;

  final String? urlImage;

  AuthModel(
      {required this.username,
      required this.email,
      required this.password,
      this.urlImage});

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
      username: json['username'],
      email: json['email'],
      password: json['password']);

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
      };
}
