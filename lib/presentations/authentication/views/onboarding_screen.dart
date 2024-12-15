import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/views/login_welcome_screen.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
import 'package:doc_booking_app/widgets/custom_text_button.dart';
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
  AuthenticationController controller = AuthenticationController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              controller.activeIndex.value = index;
            },
            // physics: NeverScrollableScrollPhysics(),
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
              decoration:
                  BoxDecoration(color: AppColors.white, borderRadius: const BorderRadius.vertical(top: Radius.circular(42))),
              padding: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Text(
                        controller.activeIndex.value == 0
                            ? 'Let us Come to You'
                            : controller.activeIndex.value == 1
                                ? 'Visit our Wellness Centres'
                                : 'Virtual Specialists',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.activeIndex.value == 0
                            ? 'Cant get to a clinic, let us come to you, book a Home visit appointment today.'
                            : controller.activeIndex.value == 1
                                ? 'Private Affordable Proactive healthcare.'
                                : 'Easily contact our Network of specialists, From Doctors to Nutritionists.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => Container(
                            margin: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                gradient: controller.activeIndex.value == index
                                    ? const LinearGradient(
                                        colors: [AppColors.blueGradient1, AppColors.blueGradient2],
                                      )
                                    : null,
                                color: controller.activeIndex.value != index ? AppColors.gray : null,
                                shape: BoxShape.circle),
                            height: 10,
                            width: 10,
                          ),
                        ),
                      ),
                    ),
                    BlueButton(
                      label: 'Next',
                      onPressed: () {
                        if (controller.activeIndex.value < 2) {
                          pageController.animateToPage(controller.activeIndex.value + 1,
                              duration: Duration(milliseconds: 250), curve: Curves.easeIn);
                        } else {
                          Get.offAllNamed(LoginWelcomeScreen.routeName);
                        }
                      },
                    ),
                    CustomTextButton(onPressed: () {}, label: 'Skip')
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
