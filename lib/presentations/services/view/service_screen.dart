import 'package:doc_booking_app/presentations/home/view/home_screen.dart';
import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/widgets/custom_intro_container.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_container_with_logo.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  static const routeName = '/service-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customIntoContainer(imgPath: "assets/images/male_doctor.png"),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 340,
                height: 500,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: HomeScreen.textList.length,
                  itemBuilder: (context, index) {
                    return containerWithLogo1(
                      imagePath: HomeScreen.imagePathList[index],
                      text: HomeScreen.textList[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
