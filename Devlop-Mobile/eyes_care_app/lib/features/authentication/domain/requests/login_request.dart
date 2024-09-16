class LoginRequest {
  final String? email;
  final String? phone;
  final String? name;
  final String? socialId;
  final String? password;

  LoginRequest._({
    this.password,
    this.email,
    this.phone,
    this.name,
    this.socialId,
  });

  factory LoginRequest.withEmail(
          {required String password, required String email}) =>
      LoginRequest._(password: password, email: email);

  factory LoginRequest.withPhone(
          {required String password, required String phone}) =>
      LoginRequest._(password: password, phone: phone);

  factory LoginRequest.withGoogle({
    required String email,
    required String name,
    required String socialId,
  }) =>
      LoginRequest._(email: email, name: name, socialId: socialId);

  Map<String, String?> toJson() {
    return {
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (name != null) 'name': name,
      if (password != null) 'password': password,
      if (socialId != null) 'social_id': socialId,
    };
  }
}
