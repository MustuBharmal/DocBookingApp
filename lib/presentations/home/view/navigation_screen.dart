import 'package:doc_booking_app/presentations/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/app_color.dart';
import '../../../util/images.dart';
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
          items: List.generate(controller.pages.length, (index) {
            final bool isSelected = controller.selectedIndex.value == index;
            return BottomNavigationBarItem(
              backgroundColor: AppColors.white,
              icon: Center(
                child: Image.asset(
                  _getIconPath(index),
                  width: 20,
                  color: isSelected ? AppColors.primary : AppColors.grey,
                ),
              ),
              label: _getLabel(index),
            );
          }),
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onItemTapped,
        ),
      ),
    );
  }

  String _getIconPath(int index) {
    switch (index) {
      case 0:
        return Images.home;
      case 1:
        return Images.stethoscope;
      case 2:
        return Images.medicalKit;
      case 3:
        return Images.user;
      default:
        return '';
    }
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Services';
      case 2:
        return 'Specialists';
      case 3:
        return 'My Profile';
      default:
        return '';
    }
  }
}
