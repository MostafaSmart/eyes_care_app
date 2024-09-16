import 'package:eyes_care_app/app.dart';
import 'package:eyes_care_app/core/hive_boxes/posts_box.dart';
import 'package:eyes_care_app/features/authentication/presentaion/password/forget_password_screen.dart';
import 'package:eyes_care_app/features/authentication/presentaion/register/register_screen.dart';
import 'package:eyes_care_app/features/posts/presentaion/screen/add_update_post_screen.dart';
import 'package:eyes_care_app/features/posts/presentaion/screen/posts_screen.dart';
import 'package:eyes_care_app/localization/translation.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/hive_boxes/auth_box.dart';
import 'core/hive_boxes/setteings_box.dart';
import 'core/services/app_services.dart';
import 'features/authentication/presentaion/login/login_screen.dart';
import 'features/authentication/presentaion/password/resetpassword_screen.dart';
import 'features/authentication/presentaion/verification_screen.dart';
import 'features/diseases/presentaion/screen/disease_info_screen.dart';
import 'features/diseases/presentaion/screen/disease_screen.dart';
import 'features/home/home_bindings.dart';
import 'localization/local_controller.dart';
import 'screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/authentication/auth_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialServices();
  await Hive.initFlutter();
  // await Hive.init();
  await Hive.openBox(SettingsBox.boxKey);

  await Hive.openBox(AuthBox.boxKey);
  await Hive.openBox(PostsBox.boxKey);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppLocallcontroller localeController = Get.put(AppLocallcontroller());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: localeController.language.languageCode == 'ar'
            ? 'Al-Jazeera' //'cairo'
            : 'Urbanist',
        colorSchemeSeed: const Color(0xff235C75),
        useMaterial3: true,
        // colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff235C75)),
      ),
      translations: AppTranslation(),
      // transitionDuration: const Duration(milliseconds: 300),
      // defaultTransition: Transition.downToUp,

      locale: localeController.language,
      initialRoute:AuthBox.isUserLoggedIn()?ScreenRoutes.mainScreen:ScreenRoutes.loginScreen,
      getPages: listScreen,
    );
  }
}

List<GetPage<dynamic>> listScreen = [
  //start auth
  GetPage(
    name: ScreenRoutes.loginScreen,
    page: () => const LoginScreen(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: ScreenRoutes.registerScreen,
    page: () => const RegisterScreen(),
  ),
  GetPage(
    name: ScreenRoutes.forgetPasswordScreen,
    page: () => const ForgetPasswordScreen(),
  ),
  GetPage(
    name: ScreenRoutes.resetPasswordScreen,
    page: () => const ResetPasswordScreen(),
    // binding: AuthBinding(),
  ),
  GetPage(
    name: ScreenRoutes.verificationScreen,
    page: () => const VerificationScreen(),
    // binding: AuthBinding(),
  ),
  //end auth
  // start
  GetPage(
    name: ScreenRoutes.mainScreen,
    page: () => const MainScreen(),
    binding: MainBinding(),
  ),
  // end
  //post
  GetPage(
    name: ScreenRoutes.postScreen,
    page: () => const PostScreen(),
    // binding: PostBinding(),
  ),

  GetPage(
    name: ScreenRoutes.addUpdatePostScreen,
    page: () => const AddUpdatePostScreen(),
    // binding: PostBinding(),
  ),

  //endpost
  // disease
  GetPage(
    name: ScreenRoutes.diseaseScreen,
    page: () => const DiseaseScreen(),
    // binding: PostBinding(),
  ),
  
  GetPage(
    name: ScreenRoutes.diseaseInfoScreen,
    page: () => const DiseaseInfoScreen(),
    // binding: PostBinding(),
  ),
  // end disease
];
