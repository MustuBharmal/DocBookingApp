import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/views/login_welcome_screen.dart';
import 'package:doc_booking_app/util/storage_util.dart';
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
  AuthController controller = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              controller.activeIndex.value = index;
            },
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
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(42))),
              padding: const EdgeInsets.all(22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: Get.height * .12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(
                          () => Text(
                            controller.activeIndex.value == 0
                                ? ConstantString.letUsComeToYou
                                : controller.activeIndex.value == 1
                                    ? ConstantString.visitWellnessCent
                                    : ConstantString.virtualSpec,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.activeIndex.value == 0
                                ? ConstantString.subHeadingForSplash1
                                : controller.activeIndex.value == 1
                                    ? ConstantString.subHeadingForSplash2
                                    : ConstantString.subHeadingForSplash3,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
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
                                      colors: [
                                        AppColors.blueGradient1,
                                        AppColors.blueGradient2
                                      ],
                                    )
                                  : null,
                              color: controller.activeIndex.value != index
                                  ? AppColors.gray
                                  : null,
                              shape: BoxShape.circle),
                          height: 10,
                          width: 10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlueButton(
                    label: ConstantString.next,
                    onPressed: () {
                      if (controller.activeIndex.value < 2) {
                        pageController.animateToPage(
                            controller.activeIndex.value + 1,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.easeIn);
                      } else {
                        StorageUtil.writeOnboardingScreenId(true);
                        Get.offAllNamed(LoginWelcomeScreen.routeName);
                      }
                    },
                  ),
                  CustomTextButton(
                    onPressed: () {
                      StorageUtil.writeOnboardingScreenId(true);
                      Get.offAllNamed(LoginWelcomeScreen.routeName);
                    },
                    label: ConstantString.skip,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
