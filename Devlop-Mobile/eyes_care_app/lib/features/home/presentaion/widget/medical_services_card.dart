import 'package:eyes_care_app/widgets/public_widget/eyecare_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class MedicalServices extends StatelessWidget {
  const MedicalServices({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 6.0),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: EyeCareText(
              text: "خدماتنا الطبية",
              fontsize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: ServiceCardWidget(
                  text: "تشخيص حالة العين",
                  colorCard: const Color(AppColor.primaryColor),
                  colorText: Colors.white,
                  icon: Icons.favorite,
                  onTap: () {},
                ),
              ),
              Flexible(
                child: ServiceCardWidget(
                  text: "استشارة طبيب",
                  colorCard: const Color(AppColor.primaryColor),
                  colorText: Colors.white,
                  icon: Icons.favorite,
                  onTap: () {},
                  flag: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceCardWidget extends StatelessWidget {
  final IconData icon;
  final Color colorCard;
  final Color colorText;
  final String text;
  final void Function()? onTap;
  final int? flag;

  const ServiceCardWidget({
    super.key,
    required this.colorCard,
    required this.icon,
    required this.text,
    required this.colorText,
    this.onTap,
    this.flag,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorCard,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 0),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(2, 2),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  size: 24,
                  color: const Color.fromARGB(255, 11, 1, 1),
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: EyeCareText(
                  textOverflow: TextOverflow.ellipsis,
                  text: text,
                  fontsize: 12,
                  fontWeight: FontWeight.w900,
                  color: const Color.fromARGB(221, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
