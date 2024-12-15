import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/global/constant_values.dart';
import 'package:doc_booking_app/widgets/custom_intro_container.dart';
import 'package:flutter/material.dart';

import '../../../global/images.dart';
import '../../../widgets/custom_container_with_logo1.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  static const routeName = '/service-screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomBannerContainer(
                imgPath: AppImage.maleDoctor,
                headerText: ConstantString.headerTextForServices,
                subText: ConstantString.subTextForServices),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 16),
              // width: 340,
              // height: 500,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                // physics: const ScrollPhysics(),
                // primary: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: ConstantValue.textListForServices.length,
                itemBuilder: (context, index) {
                  return ContainerWithIcon1(
                    onPressed: () {},
                    // iconHeight: 60,
                    // iconWidth: 60,
                    iconPath: ConstantValue.imagePathListForServices[index],
                    text: ConstantValue.textListForServices[index],
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
