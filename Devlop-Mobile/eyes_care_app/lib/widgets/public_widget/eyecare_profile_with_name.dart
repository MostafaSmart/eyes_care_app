import 'package:eyes_care_app/widgets/public_widget/eyecare_text.dart';
import 'package:flutter/material.dart';

class EyeCareProfileAvatarWithName extends StatelessWidget {
  final String pathImg;
  final String name;
  final String? date;
  final double? sizeImage;

  const EyeCareProfileAvatarWithName({
    super.key,
    required this.pathImg,
    required this.name,
    this.date,
    this.sizeImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: FittedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (pathImg != '')
              CircleAvatar(
                radius: sizeImage ?? 25,
                backgroundImage: AssetImage(pathImg),
              ),
            const SizedBox(width: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: EyeCareText(
                    text: name,
                    fontsize: 16,
                    color: Colors.grey[900],
                  ),
                ),
                const SizedBox(height: 5),
                EyeCareText(
                  text: date ?? '',
                  fontsize: 13,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
