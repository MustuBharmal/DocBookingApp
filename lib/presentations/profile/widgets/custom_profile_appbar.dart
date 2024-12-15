import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/images.dart';
import '../controller/profile_controller.dart';

class CustomProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool back;
  final ProfileController controller;

  const CustomProfileAppBar({
    required this.title,
    required this.back,
    super.key,
    required this.controller,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0),
      child: AppBar(
        centerTitle: true,
        title: Text(
          title,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(AppImage.arrowLeft),
          onPressed: () {
            controller.isEditingProfile.value = false;
            Navigator.pop(context);
          },
        ),
        actions: [
          Visibility(
            visible: !controller.isEditingProfile.value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: IconButton(
                icon: Image.asset(AppImage.editProfile),
                onPressed: () {
                  controller.isEditingProfile.toggle();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
