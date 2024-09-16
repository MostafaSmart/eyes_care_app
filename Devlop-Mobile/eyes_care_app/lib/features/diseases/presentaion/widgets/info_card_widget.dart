import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../../widgets/public_widget/eyecare_text.dart';
import '../getx/disease_info_controller.dart';

class CardContainerWidget extends StatelessWidget {
  final Widget? widget;
  final bool? isVisbaleBorder;

  const CardContainerWidget({
    super.key,
    this.widget,
    this.isVisbaleBorder = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      decoration: buildBoxDecoration(),
      child: widget,
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 3),
          blurRadius: 7,
          spreadRadius: 2,
          color: Colors.black.withOpacity(0.1),
        ),
      ],
      border: isVisbaleBorder!
          ? Border.all(
              color: Colors.teal[400]!,
              width: 1,
            )
          : null,
    );
  }
}

class InfoCardWidget extends GetView<DetailsDiseaseController> {
  final bool isShowColorCardChange;
  final IconButton? iconButton;
  final Color? color;
  final String? title;
  final String? date;
  final String? content;
  final String? imgUrl;
  final IconData? icon;
  final int? isIndex;

  const InfoCardWidget({
    super.key,
    this.isShowColorCardChange = false,
    this.iconButton,
    required this.content,
    this.color,
    this.title,
    this.icon,
    this.date,
    this.imgUrl,
    this.isIndex,
  });
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    if (isShowColorCardChange) {
      return _buildShrinkableCard();
    } else {
      return _buildStaticCard(screenHeight);
    }
  }

  Row _buildTitleRow({IconButton? iconButton}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            children: [
              if (icon != null) Icon(icon),
              const SizedBox(width: 8),
              Flexible(
                child: EyeCareText(
                  text: title ?? '',
                  fontsize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        if (iconButton != null) iconButton,
        if (isShowColorCardChange)
          Obx(
            () => controller.isCardShrunk[isIndex!].value
                ? _iconUpAndDown(Icons.keyboard_arrow_up_rounded)
                : _iconUpAndDown(Icons.keyboard_arrow_down_rounded),
          ),
      ],
    );
  }

  Icon _iconUpAndDown(IconData icon) {
    return Icon(icon, color: Colors.teal, size: 30);
  }

  Widget _buildShrinkableCard() {
    return GestureDetector(
      onTap: () => controller.toggleCardSize(isIndex!),
      child: CardContainerWidget(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleRow(),
            Obx(
              () => controller.isCardShrunk[isIndex!].value
                  ? buildInfoCard(content!, color!)
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoCard(String content, Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: color,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...content.split('\n\n').map(
              (point) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          radius: 5,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          point,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStaticCard(double screenHeight) {
    return CardContainerWidget(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleRow(iconButton: iconButton),
          const Divider(color: Colors.teal, thickness: 1),
          if (date != null) buildTextDate(date!),
          SizedBox(height: screenHeight * 0.01),
          if (content != null) buildContentText(content ?? ''),
          SizedBox(height: screenHeight * 0.02),
          if (imgUrl != null) buildImage(screenHeight, imgUrl!),
        ],
      ),
    );
  }

  Widget buildContentText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
        height: 1.5,
      ),
    );
  }

  EyeCareText buildTextDate(String date) {
    return EyeCareText(
      text: "تاريخ:$date",
      fontsize: 14,
      textAlign: TextAlign.end,
      color: Colors.grey,
    );
  }

  Widget buildImage(double screenHeight, String imgUrl) {
    return Container(
      height: screenHeight * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imgUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
