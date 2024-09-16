import 'package:get/get.dart';

import '../../localization/local_controller.dart';

class AppServices extends GetxService {
  Future<AppServices> init() async {
    Get.lazyPut(() => AppLocallcontroller());
    // Get.lazyPut(() => ThemeController(), fenix: true);

    return this;
  }
}
Future<void> initialServices() async {
  await Get.putAsync(() => AppServices().init());
}
