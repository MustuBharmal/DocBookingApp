import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool back;

  const CustomAppBar({required this.title, required this.back, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Get.width * 0.06,
                  letterSpacing: 2,
                  color: AppColors.black,
                ),
              ),
            ],
          );
        },
      ),
      leadingWidth: Get.width, // Default value, but can be adjusted if needed
      backgroundColor: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.black),
    );
  }
}