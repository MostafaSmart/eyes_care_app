class RegisterUserRequest {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? socialId;
  
  RegisterUserRequest._({
    this.name,
    this.email,
    this.password,
    this.socialId,
  });

  factory RegisterUserRequest.withEmail(
      {required String email, required String name, required String password}) {
    return RegisterUserRequest._(email: email, name: name, password: password);
  }
  factory RegisterUserRequest.withGoogle({
    required String email,
    required String name,
    required String socialId,
  }) =>
      RegisterUserRequest._(email: email, name: name, socialId: socialId);

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
