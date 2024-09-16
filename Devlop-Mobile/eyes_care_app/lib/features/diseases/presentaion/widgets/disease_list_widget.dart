import 'package:eyes_care_app/features/home/presentaion/screen/home_screen.dart';
import 'package:eyes_care_app/widgets/public_widget/eyecare_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/disease.dart';
import '../getx/disease_controller.dart';

class DiseaseListWidget extends StatelessWidget {
  final List<Disease> allDisease;
  final bool isHide;

  const DiseaseListWidget({
    super.key,
    required this.allDisease,
    this.isHide = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          allDisease.length + (isHide ? 1 : 0), // Add 1 if isHide is true
      itemBuilder: (context, index) {
        if (index == 0 && isHide) {
          return Container(
            color: const Color(0xffF2F2F2),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  EyeCareText(
                    text: "الاخير",
                    fontsize: 13,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                  EyeCareText(
                    text: "حذف الكل",
                    fontsize: 13,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          );
        }
        final diseaseIndex = index - (isHide ? 1 : 0);
        return DiseaseCard(
          name: allDisease[diseaseIndex].name ?? '',
          description: allDisease[diseaseIndex].description ?? '',
          imageUrl: allDisease[diseaseIndex].imageUrl ?? '',
          nameEn: allDisease[diseaseIndex].nameEn ?? '',
          onLongPress: () {},
          onTap: () {
            DiseaseController controller = Get.find();
            controller.goToDiseaseInfo(allDisease[diseaseIndex]);
          },
        );
      },
    );
  }
}

class DiseaseCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final String nameEn;
  final void Function()? onTap;
  final void Function()? onLongPress;

  const DiseaseCard({
    super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.nameEn,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {},
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: const Border(
            bottom: BorderSide(
              color: Color.fromARGB(74, 150, 150, 150),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: Get.width * 0.02),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _buildSpecialText(name.trim()),
                      const SizedBox(width: 6),
                      _buildSpecialText("($nameEn)", 14, true),
                    ],
                  ),
                  const SizedBox(height: 5),
                  EyeCareText(
                    text: description,
                    fontsize: 14,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const IconCircle(
              size: 30,
              icon: Icons.navigate_next_sharp,
              iconColor: Color.fromARGB(255, 170, 170, 170),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialText(String text, [double? fontSize, bool? flag]) {
    return Flexible(
      child: EyeCareText(
        text: text,
        fontsize: fontSize ?? 14,
        fontWeight: FontWeight.bold,
        color: flag != null ? Colors.teal : Colors.black,
        textOverflow: TextOverflow.ellipsis,
      ),
    );
  }
}
