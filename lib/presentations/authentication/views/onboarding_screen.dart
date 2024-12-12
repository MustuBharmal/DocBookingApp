import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboardScreen';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              activeIndex = index;
              setState(() {});
            },
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              Image.asset(AppImage.intro1, alignment: Alignment.topCenter),
              Image.asset(AppImage.intro2, alignment: Alignment.topCenter),
              Image.asset(AppImage.intro3, alignment: Alignment.topCenter),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * 0.40,
              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(42))),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('Let us Come to You'),
                  Text(
                    'Cant get to a clinic, let us come to you, book a Home visit appointment today.',
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            gradient: activeIndex == index
                                ? LinearGradient(
                                    colors: [AppColors.blueGradient1, AppColors.blueGradient2],
                                  )
                                : null,
                            color: activeIndex != index ? AppColors.gray : null,
                            shape: BoxShape.circle),
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
