class LoginModel {
  String message;
  User user;
  String token;

  LoginModel({
    required this.message,
    required this.user,
    required this.token,
  });
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
}
