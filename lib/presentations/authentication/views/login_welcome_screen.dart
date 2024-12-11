import 'package:doc_booking_app/presentations/home/view/navigation_screen.dart';
import 'package:doc_booking_app/util/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginWelcomeScreen extends StatelessWidget {
  static const String routeName = '/login-welcome-screen';

  const LoginWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 159,
            ),
            Text(
              'Welcome to',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 26,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
                letterSpacing: -0.30,
              ),
            ),
            SizedBox(
              height: Get.height * 0.12,
            ),
            Image.asset('assets/logos/company_logo.png'),
            SizedBox(
              height: Get.height * 0.065,
            ),
            Text(
              "Doctor's Booking",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 26,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0.12,
              ),
            ),
            SizedBox(
              height: Get.height * 0.27,
            ),
            GestureDetector(
              onTap: (){
                Get.offNamed(NavigationScreen.routeName);
              },
              child: Container(
                  width: 343,
                  height: 55,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(-1.00, 0.00),
                      end: Alignment(1, 0),
                      colors: [
                        Color(0xFFABE2FC),
                        Color(0xFF2267FF),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.30,
                      ),
                    ),
                  )),
            ),
            const SizedBox(
              height: 11,
            ),
            GestureDetector(
              onTap: (){
                Get.offNamed(NavigationScreen.routeName);
              },
              child: Container(
                width: 343,
                height: 55,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2, color: Color(0xFF80A5F3)),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: -0.30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
