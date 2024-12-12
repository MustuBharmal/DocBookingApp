import 'package:flutter/material.dart';

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
      title: Text(title),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
      ],
      backgroundColor: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.black),
    );
  }
}
