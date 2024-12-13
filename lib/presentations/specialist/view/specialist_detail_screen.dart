import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialistDetailScreen extends StatelessWidget {
  const SpecialistDetailScreen({super.key});

  static const routeName = '/specialist_detail-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: 0.8,
              child: Image.asset(
                "assets/images/female_doctor2.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
