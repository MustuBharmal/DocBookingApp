import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../widgets/custom_container_with_logo1.dart';

class SpecialistScreen extends StatelessWidget {
  const SpecialistScreen({super.key});

  static const routeName = '/specialist-screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImage.serviceIcon2),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.25,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: HomeController.instance.specialList.length,
                itemBuilder: (context, index) {
                  final specialist = HomeController.instance.specialList[index];
                  return ContainerWithIcon1(
                    onPressed: () {},
                    iconPath: specialist?.icon ?? '',
                    text: specialist?.name ?? '',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
