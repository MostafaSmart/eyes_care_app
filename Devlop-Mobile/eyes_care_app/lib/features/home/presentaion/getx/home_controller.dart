import 'package:get/get.dart';

import '../../../../core/constants/app_images.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  final List<String> imgList = [
    "${AppImages.pathImages}Screenshot 2024-07-04 215348.png",
    "${AppImages.pathImages}Screenshot 2024-07-04 215348.png",
    "${AppImages.pathImages}Screenshot 2024-07-04 215348.png",
    "${AppImages.pathImages}Screenshot 2024-07-04 215348.png",
  ];
}
