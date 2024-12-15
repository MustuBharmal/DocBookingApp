import 'package:flutter/material.dart';

import '../global/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool back;
  final bool isVisible;
  final VoidCallback? onPressed;

  const CustomAppBar(
      {required this.title,
      this.onPressed,
      this.isVisible = true,
      required this.back,
      super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0),
      child: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: [
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
        backgroundColor: AppColors.white,
        iconTheme: IconThemeData(color: AppColors.black),
      ),
    );
  }
}
