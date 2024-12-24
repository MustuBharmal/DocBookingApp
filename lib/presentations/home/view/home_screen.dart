import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/home/widget/custom_search_textfield.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_list.dart';
import 'package:doc_booking_app/presentations/specialist/view/specialist_detail_screen.dart';
import 'package:doc_booking_app/widgets/custom_container_with_text.dart';
import 'package:doc_booking_app/widgets/custom_header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/app_color.dart';
import '../../../global/styles.dart';
import '../../../widgets/appointment_card.dart';
import '../../../widgets/custom_container_with_logo1.dart';
import '../../../widgets/custom_specialist_container.dart';
import '../../specialist/view/list_of_specialist_screen.dart';
import '../controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello, ${AuthController.instance.user.value?.name?.capitalizeFirst ?? ''}",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomSearchTextField(
            hintText: 'Search by service or location',
          ),
          const SizedBox(
            height: 20,
          ),
          const SectionHeader(
            title: ConstantString.upcomingAppointments,
            spacing: 20,
            childWidget: AppointmentCard(),
          ),
          const SizedBox(
            height: 20,
          ),
          const SectionHeader(
            title: ConstantString.bookNow,
            spacing: 12,
            childWidget: BookingOptions(),
          ),
          Obx(
            () => SectionHeader(
              title: ConstantString.topServices,
              button: TextButton(
                onPressed: () {
                  controller.navigateTo(1);
                },
                child: Text(ConstantString.seeAll, style: subtitleStyle1),
              ),
              spacing: 20,
              childWidget: GridView.builder(
                itemCount: controller.services.length > 3
                    ? 3
                    : controller.services.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of items per row
                    crossAxisSpacing: 10, // Horizontal spacing
                    mainAxisSpacing: 20, // Vertical spacing
                    childAspectRatio: 108.67 / 122),
                itemBuilder: (BuildContext context, int index) {
                  var servicesId = controller.services[index]?.id;
                  return ContainerWithIcon1(
                    onPressed: () {
                      List<DoctorsList?> listOfDoc = controller.doctorList
                          .where((doctor) =>
                              doctor?.services == servicesId.toString())
                          .toList();

                      Get.toNamed(ListOfSpecialistScreen.routeName, arguments: {
                        'doctorList': listOfDoc,
                      });
                    },
                    iconPath: controller.services[index]!.icon!,
                    text: controller.services[index]?.name ?? '',
                  );
                },
              ),
            ),
          ),
          Obx(
            () => SectionHeader(
              title: ConstantString.topRatedSpecialist,
              button: TextButton(
                onPressed: () {
                  Get.toNamed(ListOfSpecialistScreen.routeName, arguments: {
                    'doctorList': controller.doctorList,
                  });
                },
                child: Text(ConstantString.seeAll, style: subtitleStyle1),
              ),
              spacing: 0,
              childWidget: ListView.builder(
                shrinkWrap: true,
                primary: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  final doctor = controller.doctorList[index];
                  return Column(
                    children: [
                      CustomSpecialistContainer(
                        picPath: doctor?.profilePic ?? '',
                        name: doctor?.name ?? '',
                        specialist: doctor?.specialistData?.name ?? '',
                        charges: doctor?.fees ?? '',
                        // rating: doctor.rating,
                        // review: doctor.review,
                        onPressed: () {
                          Get.to(SpecialistDetailScreen(doctor: doctor!));
                        },
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  );
                },
                itemCount: controller.doctorList.length >= 3
                    ? 3
                    : controller.doctorList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final Widget? button;
  final double spacing;
  final Widget childWidget;

  const SectionHeader({
    super.key,
    required this.title,
    this.button,
    required this.spacing,
    required this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomHeaderText(text: title),
            if (button != null) button!,
          ],
        ),
        SizedBox(height: spacing),
        childWidget,
      ],
    );
  }
}

/*class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 10,
            child: Container(
              width: Get.width * 0.890,
              height: Get.height * 0.215,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Container(
            width: Get.width * 0.890,
            height: Get.height * 0.210,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12), // Rounded rectangle
                        image: DecorationImage(
                          image: AssetImage(AppImage.femaleDoctor2),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Peater Parker',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Psychiatrist',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                          color: AppColors.blueGradient3
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.home, color: Colors.white, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            'Home Visit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.blueGradient3
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.access_time, color: Colors.white, size: 20),
                          SizedBox(width: 8),
                          Text(
                            '10:30pm',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.blueGradient3
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'October 10, 2024',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/

class BookingOptions extends StatelessWidget {
  const BookingOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomContainerWithText(
          text: ConstantString.visitLocalClinic,
        ),
        SizedBox(
          height: 10,
        ),
        CustomContainerWithText(
          text: ConstantString.arrHomeVisit,
        ),
        SizedBox(
          height: 10,
        ),
        CustomContainerWithText(
          text: ConstantString.chatWSpeciaList,
        ),
      ],
    );
  }
}
