import 'package:eyes_care_app/features/diseases/domain/entities/disease.dart';
import 'package:eyes_care_app/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiseaseController extends GetxController {
  List<Disease> allDisease = [
    const Disease(
        name: "زرق العين",
        description:
            'الوراثة: الوراثة تلعب دوراً كبيراً في لون العين، وقد يكون الوراثة هي السبب الرئيسي وراء زرقة العيون.',
        imageUrl: "assets/images/post.jpg",
        nameEn: "EoadPjsff",
        symptoms:
            'الوراثة: الوراثة تلعب دوراً كبيراً في لون العين، وقد يكون الوراثة هي السبب الرئيسي وراء زرقة العيون.\n\n'
            'مستوى الميلانين: العيون الزرقاء تحتوي على كمية قليلة من الميلانين، الذي يعطي العيون لونها. هذا يعني أن العيون ذات الميلانين الأقل قد تظهر باللون الأزرق.\n\n'
            'الضوء والبيئة: قد يبدو لون العين بشكل مختلف تبعًا للإضاءة والبيئة المحيطة.',
        treatment: "قطرات العين المضادة للالتهاب، المسكنات، الراحة",
        diagnosis:
            'الوراثة: الوراثة تلعب دوراً كبيراً في لون العين، وقد يكون الوراثة هي السبب الرئيسي وراء زرقة العيون.\n\n'
            'مستوى الميلانين: العيون الزرقاء تحتوي على كمية قليلة من الميلانين، الذي يعطي العيون لونها. هذا يعني أن العيون ذات الميلانين الأقل قد تظهر باللون الأزرق.\n\n'
            'الضوء والبيئة: قد يبدو لون العين بشكل مختلف تبعًا للإضاءة والبيئة المحيطة.',
        causes:
            'الوراثة: الوراثة تلعب دوراً كبيراً في لون العين، وقد يكون الوراثة هي السبب الرئيسي وراء زرقة العيون.\n\n'
            'مستوى الميلانين: العيون الزرقاء تحتوي على كمية قليلة من الميلانين، الذي يعطي العيون لونها. هذا يعني أن العيون ذات الميلانين الأقل قد تظهر باللون الأزرق.\n\n'
            'الضوء والبيئة: قد يبدو لون العين بشكل مختلف تبعًا للإضاءة والبيئة المحيطة.'),
    const Disease(
      name: "المياة البيضاء",
      description:
          "الوصف: المياة البيضاء هي حالة شائعة تؤدي إلى فقدان شفافية عدسة العين مما يتسبب في ضبابية الرؤية.الوصف: المياة البيضاء هي حالة شائعة تؤدي إلى فقدان شفافية عدسة العين مما يتسبب في ضبابية الرؤية.",
      imageUrl: "assets/images/post.jpg",
      nameEn: "tyddghffghf",
      symptoms: "احمرار العين، ألم، حساسية للضوء",
      treatment: "قطرات العين المضادة للالتهاب، المسكنات، الراحة",
      diagnosis:
          'مستوى الميلانين: العيون الزرقاء تحتوي على كمية قليلة من الميلانين، الذي يعطي العيون لونها. هذا يعني أن العيون ذات الميلانين الأقل قد تظهر باللون الأزرق.\n',
      causes:
          'مستوى الميلانين: العيون الزرقاء تحتوي على كمية قليلة من الميلانين، الذي يعطي العيون لونها. هذا يعني أن العيون ذات الميلانين الأقل قد تظهر باللون الأزرق.\n',
    ),
    const Disease(
      name: "جلكوما",
      description: "مرض يصيب قزحية العين ويسبب التهاب. ية العين ويسبب التهاب.",
      imageUrl: "assets/images/post.jpg",
      nameEn: "NsFD   SDDdsrrg",
      symptoms: "احمرار العين، ألم، حساسية للضوء",
      treatment: "قطرات العين المضادة للالتهاب، المسكنات، الراحة",
      diagnosis: '',
      causes: '',
    ),
  ];

  late TextEditingController textController;
  RxBool isTextChangedValue = false.obs;
  RxBool isLoading = RxBool(false);
  RxBool isHiddenField = RxBool(false);
  RxList<Disease> results = <Disease>[].obs;

  void getAllDiseases() async {

  }

  void searchDisease(String textSearch) async {}

  void clearFieldValue() {
    textController.clear();
    isTextChangedValue.value = false;
  }

  void goToDiseaseInfo(Disease disease) {
    Get.toNamed(ScreenRoutes.diseaseInfoScreen, arguments: {
      'disease': disease,
    });
  }

  void diseaseSearchSuggestions(String input) async {
    if (input.isNotEmpty) {
      results.value = (allDisease.where((Disease diseaseModel) {
        final String name = diseaseModel.name!.toLowerCase();
        final String description = diseaseModel.description!.toLowerCase();
        final String code = diseaseModel.nameEn!.toLowerCase();

        return name.contains(input.toLowerCase()) ||
            description.contains(input.toLowerCase()) ||
            code.contains(input.toLowerCase());
      }).toList());
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
