import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/global/constant_values.dart';
import 'package:doc_booking_app/widgets/custom_intro_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../global/images.dart';
import '../../../widgets/custom_container_with_logo1.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  static const routeName = '/service-screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CustomBannerContainer(
            //     imgPath: AppImage.maleDoctor,
            //     headerText: ConstantString.headerTextForServices,
            //     subText: ConstantString.subTextForServices),
            SvgPicture.asset(AppImage.serviceIcon1),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: ConstantValue.textListForServices.length,
                itemBuilder: (context, index) {
                  return ContainerWithIcon1(
                    onPressed: () {},

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
