import 'package:doc_booking_app/global/extensions.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../global/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool back;
  final bool isVisible;
  final VoidCallback? onPressed;
  final List<Widget>? actions;
  final List<Widget>? addActions;

  const CustomAppBar(
      {required this.title,
      this.onPressed,
      this.isVisible = true,
      this.back = true,
      this.addActions,
      this.actions,
      super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0),
      child: AppBar(
        leading: back
            ? Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.borderColor)),
                child: Center(
                  child: SvgPicture.asset(
                    AppImage.backArrow,
                    height: 24,
                    width: 24,
                  ),
                ),
              ).onClick(() => Get.back())
            : null,
        title: Text(title),
        centerTitle: true,
        actions: actions ??
            [
              if (addActions != null) ...addActions!,
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Visibility(
                    visible: isVisible,
                    child: InkWell(
                      onTap: onPressed,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFFF5F1FD))),
                        child: Icon(
                          Icons.notifications,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    )),
              )
            ],
        // backgroundColor: AppColors.white,
        iconTheme: IconThemeData(color: AppColors.black),
      ),
    );
  }
}
