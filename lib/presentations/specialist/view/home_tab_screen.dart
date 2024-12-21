import 'package:doc_booking_app/presentations/specialist/view/specialist_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_specialist_container.dart';
import '../../home/controller/home_controller.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.separated(
        itemBuilder: (context, index) {
          final doctorList = HomeController.instance.doctorList[index];
          return CustomSpecialistContainer(
            picPath: doctorList?.profilePic ?? '',
            name: doctorList?.name ?? '',
            specialist: doctorList?.specialization ?? '',
            charges: doctorList?.fees ?? '',
            onPressed: () {
              Get.to(SpecialistDetailScreen(
                doctor: doctorList!,
              ));
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: HomeController.instance.doctorList.length,
      );
    });
  }
}

