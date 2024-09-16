import 'package:eyes_care_app/features/authentication/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    super.id,
    super.email,
    required super.name,
    super.password,
    super.username,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        // password: json['password'],
        username: json['username']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'name': name,
    };
  }
}
