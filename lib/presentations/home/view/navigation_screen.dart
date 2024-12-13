import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/app_color.dart';
import '../../../util/images.dart';
import '../../../widgets/custom_app_bar.dart';
import '../controller/home_controller.dart';

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
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: KeyedSubtree(
            key: ValueKey<int>(controller.selectedIndex.value),
            child: controller.pages[controller.selectedIndex.value],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 1,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            elevation: 0,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.grey,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            items: List.generate(controller.pages.length, (index) {
              final bool isSelected = controller.selectedIndex.value == index;
              return BottomNavigationBarItem(
                icon: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (isSelected)
                        Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Color(0xFFABE2FC), Color(0xFF2267FF)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                        ),
                      Image.asset(
                        _getIconPath(index),
                        width: 20,
                        height: 20,
                        color: isSelected ? Colors.white : AppColors.grey,
                      ),
                    ],
                  ),
                ),
                label: _getLabel(index),
              );
            }),
            currentIndex: controller.selectedIndex.value,
            onTap: (index) {
              controller.selectedIndex.value = index;
            },
          ),
        ),
      ),
    );
  }

  String _getIconPath(int index) {
    switch (index) {
      case 0:
        return Images.home;
      case 1:
        return Images.bloodletting;
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
