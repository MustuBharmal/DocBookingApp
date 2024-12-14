import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/styles.dart';

class CustomBannerContainer extends StatelessWidget {
  const CustomBannerContainer(
      {super.key,
      required this.imgPath,
      required this.headerText,
      required this.subText});

  final String imgPath;
  final String headerText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.95,
      height: Get.height * 0.193,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment(-0.92, 0.38),
          end: Alignment(0.92, -0.38),
          colors: [Color(0xFF2267FF), Color(0xFFABC4FC)],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        //It allow to image take space outside the container
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(headerText, style: txtInterMedium12),
                const SizedBox(height: 9),
                Text(
                  subText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 0,
            child: Container(
              width: Get.width * 0.37,
              height: Get.height * 0.2325,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  scale: 1,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
