import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      height: Get.height * 0.25,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        //It allow to image take space outside the container
        children: [
          Container(
            height: Get.height * 0.2,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment(-0.92, 0.38),
                end: Alignment(0.92, -0.38),
                colors: [Color(0xFF2267FF), Color(0xFFABC4FC)],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(headerText, style: txtInterMedium12,),
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
            right: 16,
            top: -16,
            child: Image.asset(imgPath,height: 250,),
          ),
        ],
      ),
    );
  }
}
