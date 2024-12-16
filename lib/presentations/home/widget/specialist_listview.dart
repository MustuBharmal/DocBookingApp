import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_specialist_container.dart';
import '../../specialist/controller/specialist_controller.dart';
import '../../specialist/view/specialist_detail_screen.dart';

class SpecialistListView extends StatelessWidget {
  const SpecialistListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: Get.height * 0.45,
      child: ListView.separated(
        physics: const ScrollPhysics(),
        primary: true,
        itemBuilder: (context, index) {
          final specialist =
              SpecialistController.instance.filteredSpecialists[index];
          return CustomSpecialistContainer(
            name: specialist.name,
            specialist: specialist.specialist,
            charges: specialist.charges,
            rating: specialist.rating,
            review: specialist.review,
            onPressed: () {
              Get.toNamed(SpecialistDetailScreen.routeName);
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: 3,
      ),
    );
  }
}
