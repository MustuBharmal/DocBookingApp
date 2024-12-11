import 'package:doc_booking_app/presentations/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/app_color.dart';
import '../../../widgets/customer_app_bar.dart';

class NavigationScreen extends GetView<HomeController> {
  const NavigationScreen({super.key});

  static const routeName = '/navigation-screen';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomAppBar(
          title: controller.appBarTitle[controller.selectedIndex.value],
          back: false,
        ),
        body: controller.pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.primary,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: AppColors.white,
              icon: Image.asset(
                'assets/images/user.png',
                width: 20,
                color: AppColors.primary,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.white,
              icon: Image.asset(
                'assets/images/Medical Kit.png',
                width: 20,
                color: AppColors.primary,
              ),
              label: 'Service',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.white,
              icon: Image.asset(
                'assets/images/Medical Kit.png',
                width: 20,
                color: AppColors.primary,
              ),
              label: 'Visit',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.white,
              icon: Image.asset('assets/images/user.png',
                  width: 20, color: AppColors.primary),
              label: 'Order',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onItemTapped,
        ),
      ),
    );
  }
}
