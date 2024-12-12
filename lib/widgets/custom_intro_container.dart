import 'package:flutter/material.dart';

Widget customBannerContainer(
    {String? imgPath, String? headerText, String? subText}) {
  return Container(
    width: 343,
    height: 150,
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
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headerText!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 9),
              Text(
                subText!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'Inter',
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
            width: 132,
            height: 175,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imgPath!),
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
