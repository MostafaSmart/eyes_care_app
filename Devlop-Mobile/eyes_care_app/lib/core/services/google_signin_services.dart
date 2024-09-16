import 'package:eyes_care_app/app.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../features/home/home_bindings.dart';
import '../helper/app_print_class.dart';
import '../hive_boxes/auth_box.dart';

class GoogleSignInService {
  late GoogleSignIn _googleSignIn;
  static GoogleSignInAccount? user;

  GoogleSignInService._() {
    initialize();
  }

  static final GoogleSignInService _instance = GoogleSignInService._();

  factory GoogleSignInService() {
    return _instance;
  }

  void initialize() {
    AppPrint.printData("::::::::::::::::Initialize google sign in");
    const List<String> scopes = <String>['email'];

    _googleSignIn = GoogleSignIn(
      // Optional clientId
      // clientId: 'your-client_id.apps.googleusercontent.com',
      scopes: scopes,
    );
  }

  Future<void> handleSignIn() async {
    try {
      user = await _googleSignIn.signIn();

      //  GoogleSignInAuthentication? authentication = await userAccount?.authentication;

      AppPrint.printData(":::::::::::::::::::${user?.displayName} :: $user");
      Get.offAll(() => const MainScreen(), binding: MainBinding());
      AuthBox.setUserLoggedIn(true);
      
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }
}
