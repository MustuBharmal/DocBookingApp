import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:flutter/material.dart';

import '../../../global/constant_values.dart';
import '../../../widgets/custom_container_with_logo1.dart';
import '../../../widgets/custom_intro_container.dart';

class SpecialistScreen extends StatelessWidget {
  const SpecialistScreen({super.key});

  static const routeName = '/specialist-screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            CustomBannerContainer(
                imgPath: AppImage.femaleDoctor1,
                headerText: ConstantString.headerTextForSpecialist,
                subText: ConstantString.subTextForSpecialist),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.25,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: ConstantValue.textListForSpecialist.length,
                itemBuilder: (context, index) {
                  return ContainerWithIcon1(
                    onPressed: () {},
                    // iconHeight: 60,
                    // iconWidth: 60,
                    iconPath: ConstantValue.imagePathListForSpecialist[index],
                    text: ConstantValue.textListForSpecialist[index],
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
