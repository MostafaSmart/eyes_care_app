import '../widget/on_boarding/text_title.dart';
import 'package:flutter/material.dart';
import '../widget/on_boarding/container_shape.dart';
import '../widget/on_boarding/shape_circle.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  shapeRec(true),
                  const TextTitle(startText: "Eye", lasttText: "Care"),
                  Center(
                    child: Image.asset(
                      "assets/images/on_bording1.jpg",
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: const Column(
                            children: [
                              TextTitle(
                                  startText: "Eye", lasttText: "Diagnosis"),
                              SizedBox(
                                height: 3,
                              ),
                              Center(
                                child: Text(
                                  "Lorem ipsum doctor sit amet\n as consetetur sadipscing  \n ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 2, 66, 0.6),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -20,
                          right: 0,
                          child: shapeRec(false),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Positioned(
                top: 30,
                right: -110,
                child: CircleShape(
                  radius: 13,
                ),
              ),
              const Positioned(
                bottom: 100,
                left: -60,
                child: CircleShape(
                  radius: 12,
                ),
              ),
              Positioned(
                bottom: 40,
                child: Container(
                  //   padding: EdgeInsets.all(25),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 52,
                  width: 222,
                  child: const Center(
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column shapeRec(bool dir) {
    return Column(
      crossAxisAlignment:
          dir ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        ContainerShape(
            width: 70, color: const Color.fromRGBO(35, 92, 117, 1), isDir: dir),
        ContainerShape(
          width: 40,
          color: const Color.fromRGBO(35, 92, 117, 0.59),
          isDir: dir,
        ),
      ],
    );
  }
}

List mycolor = const [
  Colors.red,
  Color.fromARGB(255, 0, 0, 0),
  Color.fromARGB(255, 77, 223, 111),
];
