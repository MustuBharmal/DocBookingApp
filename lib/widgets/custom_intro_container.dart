import 'package:flutter/material.dart';

Widget customIntoContainer({String? imgPath}) {
  return Container(
    width: 343,
    height: 170,
    decoration: ShapeDecoration(
      gradient: const LinearGradient(
        begin: Alignment(-0.92, 0.38),
        end: Alignment(0.92, -0.38),
        colors: [Color(0xFF2267FF), Color(0xFFABC4FC)],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        const Padding(
          padding:
          EdgeInsets.symmetric(horizontal: 30, vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose the best \nservice!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 9),
              Text(
                'Select your service and the \nlocations according to it.',
                style: TextStyle(
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
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}