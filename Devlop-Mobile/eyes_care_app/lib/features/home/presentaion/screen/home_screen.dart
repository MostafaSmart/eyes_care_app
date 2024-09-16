import 'package:eyes_care_app/core/constants/colors.dart';
import 'package:eyes_care_app/features/diseases/presentaion/screen/disease_screen.dart';
import 'package:eyes_care_app/features/home/presentaion/getx/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/notification_icon.dart';
import '../../../../widgets/public_widget/eyecare_profile_with_name.dart';
import '../../../../widgets/public_widget/eyecare_text.dart';
import '../widget/medical_services_card.dart';
import '../widget/special_offer_home.dart';
import '../widget/searche_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    HomeController controller = Get.find();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            const HeaderPage(),
            Row(
              children: [
                Flexible(
                  flex: 7,
                  child: EyeCareSearchContainer(
                    width: screenWidth,
                    text: "بحث",
                    onTap: () {},
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const IconCircle(
                    size: 40,
                    color: Color(AppColor.primaryColor),
                    icon: Icons.tune,
                    iconColor: Colors.white,
                    borderRadius: 10,
                  ),
                )
              ],
            ),

            SizedBox(height: screenHeight * 0.02),
            SpecialOfferCardHome(imgList: controller.imgList),
            // SizedBox(height: screenHeight * 0.01),
            const MedicalServices(),
            SizedBox(height: screenHeight * 0.02),
            const MedicalContent(),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }
}

class HeaderPage extends StatelessWidget {
  const HeaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: EyeCareProfileAvatarWithName(
                  name: "هلا بشار",
                  pathImg: 'assets/images/post.jpg',
                  date: "كيف ممكن اساعدك؟",
                  sizeImage: 22,
                ),
              ),
              NotificationIcon(notificationCount: 1, onPressed: () {}),
            ],
          ),
        ),
      ],
    );
  }
}

class IconCircle extends StatelessWidget {
  final double size;
  final Color? color;
  final IconData icon;
  final Color iconColor;
  final double borderRadius;

  const IconCircle({
    super.key,
    required this.size,
    this.color,
    required this.icon,
    required this.iconColor,
    this.borderRadius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color ?? Colors.transparent,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 24,
      ),
    );
  }
}

class MedicalContent extends StatelessWidget {
  const MedicalContent({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const EyeCareText(
              text: "المحتوى الطبي",
              fontsize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
            GestureDetector(
              onTap: () {},
              child: const EyeCareText(
                text: "عرض الكل",
                fontsize: 12,
                color: Color.fromARGB(75, 62, 63, 63),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildServiceCard(
              onTap: () {
                Get.to(
                  () => const DiseaseScreen(),
                );
              },
              screenWidth: screenWidth,
              icon: Icons.favorite,
              text: "الأمراض",
              color: Colors.redAccent,
            ),
            buildServiceCard(
              onTap: () {},
              screenWidth: screenWidth,
              icon: Icons.visibility,
              text: "الدليل الطبي",
              color: Colors.greenAccent,
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildServiceCard(
              screenWidth: screenWidth,
              icon: Icons.lens,
              text: "نصائح",
              color: Colors.blueAccent,
            ),
            buildServiceCard(
              screenWidth: screenWidth,
              icon: Icons.healing,
              text: "Surgery",
              color: Colors.orangeAccent,
            ),
          ],
        ),
      ],
    );
  }
}

Widget buildServiceCard({
  required double screenWidth,
  required IconData icon,
  required String text,
  required Color color,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: screenWidth * 0.4,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(color: const Color.fromARGB(31, 68, 51, 51), width: 2),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 30,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          EyeCareText(
            text: text,
            fontsize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ],
      ),
    ),
  );
}
