class LoginModel {
  String message;
  User user;
  String token;

  LoginModel({
    required this.message,
    required this.user,
    required this.token,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'],
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }
}

class User {
  int id;
  String name;
  String email;
  DateTime emailVerifiedAt;
  String role;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: DateTime.parse(json['email_verified_at']),
      role: json['role'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
