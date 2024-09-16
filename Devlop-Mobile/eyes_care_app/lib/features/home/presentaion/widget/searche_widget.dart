import 'package:flutter/material.dart';

import '../../../../widgets/eyecare_button_icon.dart';

class EyeCareSearchContainer extends StatelessWidget {
  final double width;
  final String text;
  final void Function()? onTap;

  const EyeCareSearchContainer({
    super.key,
    required this.width,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: width,
        decoration: boxDecorationWidget(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: EyeCareTextIconHorizontal(
            icon: Icons.search,
            text: text,
            colorText: const Color.fromARGB(255, 120, 120, 120),
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
      ),
    );
  }

  BoxDecoration boxDecorationWidget() {
    return BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(255, 243, 243, 243),
          offset: Offset(2, 2),
          blurRadius: 5,
        ),
        BoxShadow(
          color: Color.fromARGB(255, 255, 255, 255),
          offset: Offset(4, 2),
          blurRadius: 15,
        ),
      ],
    );
  }
}
