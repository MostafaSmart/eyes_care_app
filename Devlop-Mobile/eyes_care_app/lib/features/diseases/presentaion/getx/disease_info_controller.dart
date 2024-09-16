import 'package:eyes_care_app/features/diseases/domain/entities/disease.dart';
import 'package:get/get.dart';

class DetailsDiseaseController extends GetxController {
  RxBool isHide = false.obs;

  Disease? disease;

  List<String> get titles => [
        disease?.name ?? '',
        "    اسباب ${disease?.name ?? ''}",
        "اعراض ${disease?.name ?? ''}",
        "طرق تشخيص ${disease?.name ?? ''}",
        "طرق الوقايه ${disease?.name ?? ''}",
      ];

  List<String> get contents => [
        disease?.description ?? '',
        disease?.causes ?? '',
        disease?.diagnosis ?? '',
        disease?.symptoms ?? '',
        disease?.treatment ?? '',
      ];

  late final List<RxBool> isCardShrunk;

  void toggleCardSize(int index) {
    isCardShrunk[index].value = !isCardShrunk[index].value;
  }

  void getDisease() {
    disease = Get.arguments['disease'];
  }

  @override
  void onInit() {
    getDisease();
    isCardShrunk = List.generate(titles.length, (_) => RxBool(false));
    super.onInit();
  }
}
