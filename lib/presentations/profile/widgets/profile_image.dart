import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/app_color.dart';
import '../../../global/images.dart';
import '../controller/profile_controller.dart';

class ProfileImage extends StatelessWidget {
  final bool isEditing; // Flag to determine view or edit mode
  final String initialImageUrl;

  const ProfileImage({
    super.key,
    required this.initialImageUrl,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Center(
      child: Stack(
        alignment: Alignment.center, // Align the stack to center
        clipBehavior: Clip.none, // Allow elements to overflow outside
        children: [
          // Reactive Circle Avatar for Profile Image
          Obx(() => Container(
                width: 118, // Match width
                height: 118, // Match height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl: controller.imageUrl.value,
                ),
              )),

          // Camera Icon for Editing
          if (isEditing)
            Positioned(
              bottom: -16, // Half outside the container
              child: GestureDetector(
                onTap: () => controller.pickImage(), // Trigger image picker
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 24,
                  child: CircleAvatar(
                    radius: 21, // Size of the circle
                    backgroundColor: AppColors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      // Padding inside the circle
                      child: Image.asset(
                        AppImage.camera,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
