import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/app_color.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child:Column(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.white,
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new)),
            ),
          ],
        ),
      ),
    );
  }
}
