class User {
  final int? id;
  final String? email;
  final String? password;
  final String? name;
  final String? username;

  User({
    this.id,
    this.email,
    this.password,
    required this.name,
    this.username,
  });
   @override
  String toString() {
    return 'UserModel{username: $username, email: $email}'; 
  }
}
