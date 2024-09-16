class ForgetPasswordRequest {
  final String? email;
  final String? phone;

  ForgetPasswordRequest._({this.email, this.phone});

  factory ForgetPasswordRequest.withEmail({required String email}) =>
      ForgetPasswordRequest._(email: email);

  factory ForgetPasswordRequest.withPhone({required String phone}) =>
      ForgetPasswordRequest._(phone: phone);

  Map<String, String?> toJson() {
    return {
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
    };
  }
}

class VerifyResetPasswordTokenRequest extends ForgetPasswordRequest {
  final String token;
  VerifyResetPasswordTokenRequest.withEmail(
      {required String email, required this.token})
      : super._(email: email);

  VerifyResetPasswordTokenRequest.withPhone(
      {required String phone, required this.token})
      : super._(phone: phone);

  @override
  Map<String, String?> toJson() {
    return {
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      'token': token,
    };
  }
}

class ResetPasswordRequest extends VerifyResetPasswordTokenRequest {
  final String newPassword;
  ResetPasswordRequest.withEmail({
    required super.email,
    required super.token,
    required this.newPassword,
  }) : super.withEmail();
  @override
  Map<String, String?> toJson() {
    return {
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      'token': token,
      'password': newPassword,
    };
  }
}
