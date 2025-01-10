import 'package:doc_booking_app/global/constant_values.dart';
import 'package:doc_booking_app/global/extensions.dart';
import 'package:doc_booking_app/presentations/home/view/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../global/app_color.dart';
import '../../../global/images.dart';
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
          onPressed: (){
            Get.toNamed(NotificationScreen.routeName);
          },
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: KeyedSubtree(
            key: ValueKey<int>(controller.selectedIndex.value),
            child: ConstantValue.pages[controller.selectedIndex.value],
          ),
        ),
        bottomNavigationBar: Container(
          // height: 80,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                spreadRadius: 1,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              ConstantValue.pages.length,
              (index) {
                return _buildNavIcon(index).onClick(() {
                  controller.selectedIndex.value = index;
                });
              },
            ),
          ) /*BottomNavigationBar(
            elevation: 0,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.grey,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            items: List.generate(
              ConstantValue.pages.length,
              (index) {
                return BottomNavigationBarItem(
                  icon: _buildNavIcon(index),
                  label: '',
                );
              },
            ),
            currentIndex: controller.selectedIndex.value,
            onTap: (index) {
              controller.selectedIndex.value = index;
            },
          )*/
          ,
        ),
      ),
    );
  }

  Widget _buildNavIcon(int index) {
    if (controller.selectedIndex.value == index) {
      return Transform.translate(
        offset: Offset(0, -25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.blueGradient1,
                      AppColors.blueGradient2,
                    ],
                  ),
                  shape: BoxShape.circle),
              child: SvgPicture.asset(
                _getIconPath(index, controller.selectedIndex.value == index),
                width: 24,
                height: 24,
                // color: /*controller.selectedIndex.value == index ? Colors.transparent :*/ AppColors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              _getLabel(index),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      );
    } else {
      return SvgPicture.asset(
        _getIconPath(index, controller.selectedIndex.value == index),
        width: 24,
        height: 24,
        // color: /*controller.selectedIndex.value == index ? Colors.transparent :*/ AppColors.grey,
      );
    }
  }

  String _getIconPath(int index, bool active) {
    switch (index) {
      case 0:
        if (active) {
          return AppImage.homeActive;
        } else {
          return AppImage.homeInactive;
        }
      case 1:
        if (active) {
          return AppImage.servicesActive;
        } else {
          return AppImage.servicesInactive;
        }
      case 2:
        if (active) {
          return AppImage.specialistActive;
        } else {
          return AppImage.specialistInactive;
        }
      case 3:
        if (active) {
          return AppImage.myProfileActive;
        } else {
          return AppImage.myProfileInactive;
        }
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
