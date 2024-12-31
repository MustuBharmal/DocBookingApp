import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_container_with_logo1.dart';
import '../models/doctor_list.dart';
import 'list_of_specialist_screen.dart';

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
            Image.asset(AppImage.topContainerForSpecialists),
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
                itemCount: HomeController.instance.specialistsList.length,
                itemBuilder: (context, index) {
                  var specialistID =
                      HomeController.instance.specialistsList[index]?.id;
                  final specialist =
                      HomeController.instance.specialistsList[index];
                  return ContainerWithIcon1(
                    onPressed: () {
                      List<DoctorsList?> listOfDoc = HomeController
                          .instance.doctorList
                          .where((doctor) =>
                              doctor.specialization == specialistID.toString())
                          .toList();

                      Get.toNamed(ListOfSpecialistScreen.routeName, arguments: {
                        'doctorList': listOfDoc,
                        'specializationId': specialistID
                      });
                    },
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
