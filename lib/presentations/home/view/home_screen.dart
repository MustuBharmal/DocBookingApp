import 'package:card_stack_widget/card_stack_widget.dart';
import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/home/view/booking_history_detail.dart';
import 'package:doc_booking_app/presentations/home/widget/custom_search_textfield.dart';
import 'package:doc_booking_app/presentations/profile/view/prescription_screen.dart';
import 'package:doc_booking_app/presentations/services/view/list_services_doctor.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_list.dart';
import 'package:doc_booking_app/presentations/specialist/view/specialist_detail_screen.dart';
import 'package:doc_booking_app/widgets/custom_container_with_text.dart';
import 'package:doc_booking_app/widgets/custom_header_text.dart';
import 'package:doc_booking_app/widgets/upcoming_appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/app_color.dart';
import '../../../global/styles.dart';
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
      child: Obx(
        () => Column(
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
            if (controller.dashboard.value?.upcomingAppointments.isNotEmpty == true) ...[
              const SizedBox(
                height: 20,
              ),
              SectionHeader(title: ConstantString.upcomingAppointments, spacing: 12, childWidget: Container()),
              SizedBox(
                height: controller.dashboard.value!.upcomingAppointments.length > 1 ? Get.height * 0.350 : Get.height * 0.250,
                child: CardStackWidget(
                  opacityChangeOnDrag: false,
                  swipeOrientation: CardOrientation.down,
                  cardDismissOrientation: CardOrientation.down,
                  positionFactor: 0.5,
                  scaleFactor: 0.8,
                  alignment: Alignment.topCenter,
                  reverseOrder: false,
                  animateCardScale: true,
                  dismissedCardDuration: const Duration(milliseconds: 150),
                  cardList: (controller.dashboard.value?.upcomingAppointments
                          .map((appointment) => CardModel(
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(BookingHistoryDetails.routeName, arguments: {'bookingDetails': appointment});
                                  },
                                  child: UpcomingAppointmentCard(appointmentData: appointment),
                                ),
                                gradient: LinearGradient(
                                  colors: [AppColors.blueGradient2, AppColors.blueGradient3],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                radius: Radius.circular(20),
                              ))
                          .toList() ??
                      []),
                ),
              ),
            ],
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
                  itemCount: controller.services.length > 3 ? 3 : controller.services.length,
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
                        List<DoctorsList?> listOfDoc =
                            controller.doctorList.where((doctor) => doctor.services == servicesId.toString()).toList();

                        Get.toNamed(ListOfServicesDoctorScreen.routeName,
                            arguments: {'doctorList': listOfDoc, 'serviceId': servicesId});
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
                    Get.toNamed(
                      ListOfSpecialistScreen.routeName,
                      arguments: {
                        'doctorList': controller.doctorList,
                      },
                    );
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
                          picPath: doctor.profilePic ?? '',
                          name: doctor.name ?? '',
                          specialist: doctor.specialistData?.name ?? '',
                          charges: doctor.fees ?? '',
                          // rating: doctor.rating,
                          // review: doctor.review,
                          onPressed: () {
                            Get.toNamed(SpecialistDetailScreen.routeName, arguments: {'doctor': doctor, 'serviceType': 'Clinic'});
                          },
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  },
                  itemCount: controller.doctorList.length >= 3 ? 3 : controller.doctorList.length,
                ),
              ),
            ),
          ],
        ),
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

class BookingOptions extends StatelessWidget {
  const BookingOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            HomeController.instance.navigateTo(1);
          },
          child: CustomContainerWithText(
            text: ConstantString.visitLocalClinic,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () => Get.toNamed(ListOfSpecialistScreen.routeName, arguments: {
            'doctorList': HomeController.instance.doctorList,
            'specialist': 0,
          }),
          child: CustomContainerWithText(
            text: ConstantString.arrHomeVisit,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () => Get.toNamed(PrescriptionScreen.routeName),
          child: CustomContainerWithText(
            text: ConstantString.chatWithSpecialist,
          ),
        ),
      ],
    );
  }
}
