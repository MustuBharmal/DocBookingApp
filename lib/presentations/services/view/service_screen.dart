import 'package:doc_booking_app/global/constant_values.dart';
import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/widgets/custom_intro_container.dart';
import 'package:flutter/material.dart';
import '../../../global/images.dart';
import '../../../widgets/custom_container_with_logo1.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              CustomBannerContainer(
                  imgPath: AppImage.maleDoctor,
                  headerText: ConstantString.headerTextForServices,
                  subText: ConstantString.subTextForServices),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 340,
                height: 500,
                child: GridView.builder(
                  physics: const ScrollPhysics(),
                  primary: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: ConstantValue.textListForServices.length,
                  itemBuilder: (context, index) {
                    return ContainerWithIcon1(
                      onPressed: () {},
                      height: 60,
                      width: 69,
                      iconPath: ConstantValue.imagePathListForServices[index],
                      text: ConstantValue.textListForServices[index],
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
