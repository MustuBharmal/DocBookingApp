import 'package:doc_booking_app/presentations/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/images.dart';
import '../../../widgets/custom_container_with_logo1.dart';
import '../../specialist/models/doctor_list.dart';
import '../../specialist/view/list_of_specialist_screen.dart';

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
            Image.asset(AppImage.topContainerForServices),
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
                itemCount: HomeController.instance.services.length,
                itemBuilder: (context, index) {
                  var servicesId = HomeController.instance.services[index]?.id;
                  return ContainerWithIcon1(
                    onPressed: () {
                      List<DoctorsList?> listOfDoc = HomeController.instance.doctorList
                          .where((doctor) =>
                      doctor?.services == servicesId.toString())
                          .toList();

                      Get.toNamed(ListOfSpecialistScreen.routeName, arguments: {
                        'doctorList': listOfDoc,
                      });
                    },
                    iconPath: HomeController.instance.services[index]?.icon ?? '',
                    text: HomeController.instance.services[index]?.name ?? '',
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
