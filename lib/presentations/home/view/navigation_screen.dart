import 'package:doc_booking_app/global/constant_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/app_color.dart';
import '../../../global/images.dart';
import '../../../widgets/custom_app_bar.dart';
import '../controller/home_controller.dart';
import 'package:doc_booking_app/presentations/home/view/home_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/profile_screen.dart';
import 'package:doc_booking_app/presentations/services/view/service_screen.dart';
import 'package:doc_booking_app/presentations/specialist/view/specialist_screen.dart';

class NavigationScreen extends GetView<HomeController> {
  const NavigationScreen({super.key});

  static const routeName = '/navigation-screen';

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        backgroundColor: AppColors.scaffoldBGColor,
        appBar: CustomAppBar(
          title: controller.appBarTitle[controller.selectedIndex.value],
          back: false,
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
          height: 80,
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
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -20,
                left: (MediaQuery.of(context).size.width / 4) * controller.selectedIndex.value + 20,
                child: _buildActiveButton(),
              ),
              BottomNavigationBar(
                elevation: 0,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                selectedItemColor: AppColors.primary,
                unselectedItemColor: AppColors.grey,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                items: List.generate(ConstantValue.pages.length, (index) {
                  return BottomNavigationBarItem(
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildNavIcon(index),
                        const SizedBox(height: 4),
                        Text(
                          _getLabel(index),
                          style: TextStyle(
                            fontSize: 12,
                            color: controller.selectedIndex.value == index
                                ? AppColors.primary
                                : AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                    label: '',
                  );
                }),
                currentIndex: controller.selectedIndex.value,
                onTap: (index) {
                  controller.selectedIndex.value = index;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActiveButton() {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFFABE2FC), Color(0xFF2267FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            spreadRadius: 1,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          _getIconPath(controller.selectedIndex.value),
          width: 24,
          height: 24,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildNavIcon(int index) {
    return Image.asset(
      _getIconPath(index),
      width: 24,
      height: 24,
      color: controller.selectedIndex.value == index ? Colors.transparent : AppColors.grey,
    );
  }



  String _getIconPath(int index) {
    switch (index) {
      case 0:
        return AppImage.home;
      case 1:
        return AppImage.bloodletting;
      case 2:
        return AppImage.medicalKit;
      case 3:
        return AppImage.user;
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
