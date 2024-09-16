import 'package:eyes_care_app/features/diseases/presentaion/getx/disease_controller.dart';
import 'package:eyes_care_app/widgets/public_widget/eyecare_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../widgets/public_widget/eyecare_textformfield.dart';
import '../../../home/presentaion/screen/home_screen.dart';
import '../widgets/disease_list_widget.dart';

class DiseaseScreen extends StatelessWidget {
  const DiseaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DiseaseController controller = Get.put(DiseaseController());
    return Scaffold(
      appBar: buildAppBar(controller),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Column(
              children: [
                Obx(() {
                  if (controller.isHiddenField.value) {
                    return buildSearchRow(controller);
                  }
                  return const SizedBox.shrink();
                }),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onPanDown: (details) {
                FocusScope.of(context).unfocus();
              },
              child: Obx(
                () {
                  if (!(controller.isHiddenField.value)) {
                    return DiseaseListWidget(allDisease: controller.allDisease);
                  } else if (controller.results.isNotEmpty) {
                    return DiseaseListWidget(
                        isHide: true, allDisease: controller.results);
                  } else {
                    return const Center(child: Text("مامن نتائج"));
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(DiseaseController controller) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Flexible(
            child: EyeCareText(
              text: "الامراض",
              fontsize: 22,
              color: Colors.black,
            ),
          ),
          buildActionAppBar(controller),
        ],
      ),
      forceMaterialTransparency: true,
    );
  }

  Widget buildSearchRow(DiseaseController controller) {
    return Row(
      children: [
        Flexible(
          child: EyeTextFormFiled(
            controller: controller.textController,
            hintTex: "بحث",
            suffixIcon: controller.isTextChangedValue.value
                ? InkWell(
                    onTap: () => controller.clearFieldValue(),
                    child: const Icon(Icons.clear, size: 22),
                  )
                : null,
            onChanged: (inputText) {
              controller.diseaseSearchSuggestions(inputText);
              controller.isTextChangedValue.value = inputText.isNotEmpty;
            },
          ),
        ),
        const IconCircle(
          size: 40,
          color: Colors.white,
          icon: Icons.tune,
          iconColor: Color.fromARGB(255, 0, 0, 0),
        ),
      ],
    );
  }

  Row buildActionAppBar(DiseaseController controller) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            controller.isHiddenField.value = false;
          },
          icon: const Icon(Icons.grid_view_sharp),
        ),
        Obx(
          () {
            if (!(controller.isHiddenField.value)) {
              return IconButton(
                  onPressed: () {
                    controller.isHiddenField.value =
                        !controller.isHiddenField.value;
                  },
                  icon: const Icon(Icons.search));
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
