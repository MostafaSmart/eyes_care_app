import 'package:hive_flutter/adapters.dart';

class AuthBox {
  static const boxKey = "authBox";
  static const authToken = "authToken";
  static const currentUserData = "currentUserData";
  static const userLoggedIn = "userLoggedIn";


  
  static bool isUserLoggedIn() {
    final authBox = Hive.box(AuthBox.boxKey);
    return authBox.get(AuthBox.userLoggedIn, defaultValue: false);
  }

  static void setAuthToken(String token) {
    final authBox = Hive.box(AuthBox.boxKey);
    authBox.put(AuthBox.authToken, token);
  }

  static void setUserLoggedIn(bool isUserLoggedIn) {
    final authBox = Hive.box(AuthBox.boxKey);
    authBox.put(AuthBox.userLoggedIn, isUserLoggedIn);
  }

  static String? getAuthToken() {
    final authBox = Hive.box(AuthBox.boxKey);
    return authBox.get(AuthBox.authToken);
  }
}
