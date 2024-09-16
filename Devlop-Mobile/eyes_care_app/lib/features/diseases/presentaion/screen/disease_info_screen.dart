import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/colors.dart';
import '../../../../widgets/public_widget/eyecare_text.dart';
import '../getx/disease_info_controller.dart';
import '../widgets/info_card_widget.dart';

class DiseaseInfoScreen extends StatelessWidget {
  const DiseaseInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsDiseaseController controller = Get.put(DetailsDiseaseController());
    return Scaffold(
      appBar: AppBar(
        title: const EyeCareText(
          text: "الامراض",
          fontsize: 18,
          color: Colors.white,
        ),
        backgroundColor: const Color(AppColor.primaryColor),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Column(
          children: [
            const HorizontalDoctorContactCard(),
            Expanded(
              child: ListView.builder(
                itemCount: controller.titles.length,
                itemBuilder: (context, index) {
                  if (controller.contents[index].isNotEmpty) {
                    return InfoCardWidget(
                      title: controller.titles[index],
                      content: controller.contents[index],
                      date: index == 0 ? "2024-10-5" : null,
                      imgUrl: index == 0 ? controller.disease!.imageUrl : null,
                      color: index == 0
                          ? const Color.fromARGB(255, 0, 0, 0)
                          : getCardColor(index - 1),
                      icon: index == 0 ? null : getIcon(index - 1),
                      iconButton: index == 0
                          ? IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.share),
                            )
                          : null,
                      isIndex: index == 0 ? 0 : index,
                      isShowColorCardChange: index == 0 ? false : true,
                    );
                  }
                  return null;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Color getCardColor(int index) {
  switch (index) {
    case 0:
      return Colors.white;
    case 1:
      return const Color.fromARGB(255, 228, 222, 222);
    case 2:
      return Colors.amber.shade50;
    case 3:
      return Colors.pink.shade50;
    default:
      return Colors.grey.shade200;
  }
}

IconData getIcon(int index) {
  switch (index) {
    case 0:
      return Icons.info;
    case 1:
      return Icons.view_carousel_sharp;
    case 2:
      return Icons.check_outlined;
    case 3:
      return Icons.warning;
    default:
      return Icons.help_outline;
  }
}

class HorizontalDoctorContactCard extends StatelessWidget {
  const HorizontalDoctorContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CardContainerWidget(
      isVisbaleBorder: true,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CardContainerWidget(isVisbaleBorder: true),
          const Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "تواصل مع طبيب الآن",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "استشر طبيبك",
                  style: TextStyle(
                    fontSize: 11,
                    // fontWeight: FontWeight.bold,
                    color: Color.fromARGB(147, 0, 105, 93),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            // margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 3),
                  blurRadius: 6,
                  spreadRadius: 2,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
              border: Border.all(
                color: Colors.lightBlue.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: const Row(
              children: [
                Icon(Icons.video_call_outlined),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "تواصل ",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
