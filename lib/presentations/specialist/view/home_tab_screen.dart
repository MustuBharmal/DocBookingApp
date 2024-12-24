import 'package:doc_booking_app/presentations/specialist/view/specialist_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_specialist_container.dart';
import '../models/doctor_list.dart';

class HomeTabWidget extends StatelessWidget {
  final List<DoctorsList?> doctorList;

  const HomeTabWidget({required this.doctorList, super.key});

  @override
  Widget build(BuildContext context) {
    if (doctorList.isEmpty) {
      return Center(
        child: Text('No Doctor Available'),
      );
    }
    return ListView.separated(
      itemBuilder: (context, index) {
        final docList = doctorList[index];
        return CustomSpecialistContainer(
          picPath: docList?.profilePic ?? '',
          name: docList?.name ?? '',
          specialist: docList?.serviceData?.name ?? '',
          charges: docList?.fees ?? '',
          onPressed: () {
            Get.to(
              SpecialistDetailScreen(
                doctor: docList!,
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: doctorList.length,
    );
  }
}
