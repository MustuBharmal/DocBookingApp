import 'package:flutter/material.dart';

import '../global/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool back;
  final bool isVisible;

  const CustomAppBar({required this.title, this.isVisible = true, required this.back, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0),
      child: AppBar(
        scrolledUnderElevation: 0,
        title: Text(title),
        centerTitle: true,
        actions: [Visibility(visible: isVisible, child: IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)))],
        backgroundColor: AppColors.transparent,
        iconTheme: IconThemeData(color: AppColors.black),
      ),
    );
  }
}
