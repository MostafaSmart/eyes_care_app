import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/colors.dart'; 

class SpecialOfferCardHome extends StatelessWidget {
  final List<String> imgList;

  const SpecialOfferCardHome({super.key, required this.imgList});

  @override
  Widget build(BuildContext context) {
    final RxInt currentIndex = 0.obs;

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: imgList.length,
          options: CarouselOptions(
            height: 180,
            // autoPlay: ,
            enableInfiniteScroll: true,
            initialPage: 0,
            padEnds: false,
            onPageChanged: (index, _) {
              currentIndex.value = index;
            },
          ),
          itemBuilder: (context, index, realIndex) => Image.asset(
            imgList[index],
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(height: 8),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              imgList.length,
              (index) => Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: currentIndex.value == index
                      ? const Color(AppColor.primaryColor)
                      : const Color.fromARGB(255, 210, 208, 208),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
