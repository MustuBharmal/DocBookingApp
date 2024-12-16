import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/presentations/home/controller/home_controller.dart';
import 'package:doc_booking_app/presentations/home/widget/custom_search_textfield.dart';
import 'package:doc_booking_app/presentations/specialist/controller/specialist_controller.dart';
import 'package:doc_booking_app/presentations/specialist/view/specialist_detail_screen.dart';
import 'package:doc_booking_app/widgets/custom_container_with_text.dart';
import 'package:doc_booking_app/widgets/custom_header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/app_color.dart';
import '../../../global/constant_values.dart';
import '../../../global/styles.dart';
import '../../../widgets/custom_container_with_logo1.dart';
import '../../../widgets/custom_specialist_container.dart';
import '../../specialist/view/list_of_specialist_screen.dart';
import '../widget/appointment_card.dart';
import '../widget/booking_option.dart';
import '../widget/section_header.dart';
import '../widget/service_listview.dart';
import '../widget/specialist_listview.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, John Doe",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
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
              child: AppointmentCard(),
            ),
            const SizedBox(
              height: 20,
            ),
            const SectionHeader(
              title: ConstantString.bookNow,
              spacing: 0,
              child: BookingOptions(),
            ),
            SectionHeader(
              title: ConstantString.topServices,
              button: TextButton(
                onPressed: () {
                  controller.navigateTo(1);
                },
                child: Text("See All", style: subtitleStyle1),
              ),
              spacing: 20,
              child: const ServiceListView(),
            ),
            SectionHeader(
              title: ConstantString.topRatedSpecialist,
              button: TextButton(
                onPressed: () {
                  Get.toNamed(ListOfSpecialistScreen.routeName);
                },
                child: Text("See All", style: subtitleStyle1),
              ),
              spacing: 0,
              child: const SpecialistListView(),
            ),
          ],
        ),
      ),
    );
  }
}
