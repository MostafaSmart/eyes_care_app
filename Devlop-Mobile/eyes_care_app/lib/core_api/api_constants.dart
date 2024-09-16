class ApiConstants {
  static const header = {
    'Accept': 'application/json',
    'x_api_key': '',
  };

  static const String baseUrl = "https://reqres.in/api/";

  ///=========================================   Auth Urls ===============================================
  // ignore: constant_identifier_names
  static const String AUTH_ENDPOINT = "auth/";
  // ignore: non_constant_identifier_names
  static String LOGIN = "${AUTH_ENDPOINT}login";
  // ignore: non_constant_identifier_names
  static String REGISTER_USER = "${AUTH_ENDPOINT}register";
}
