import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/global/images.dart';
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
            "Hello, John Doe",
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
          // have to discuss with Mohd bhai
          SectionHeader(
            title: ConstantString.topServices,
            button: TextButton(
              onPressed: () {
                controller.navigateTo(1);
              },
              child: Text(ConstantString.seeAll, style: subtitleStyle1),
            ),
            spacing: 20,
            childWidget: GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.95),
              children: [
                ContainerWithIcon1(
                  onPressed: () {},
                  iconPath: AppImage.homeCategory1,
                  text: ConstantValue.textListForServices[0],
                ),
                ContainerWithIcon1(
                  onPressed: () {},
                  iconPath: AppImage.homeCategory2,
                  text: ConstantValue.textListForServices[1],
                ),
                ContainerWithIcon1(
                  onPressed: () {},
                  iconPath: AppImage.homeCategory3,
                  text: ConstantValue.textListForServices[2],
                ),
              ],
            ),
          ),
          // have to discuss with Mohd bhai
          SectionHeader(
            title: ConstantString.topRatedSpecialist,
            button: TextButton(
              onPressed: () {
                Get.toNamed(ListOfSpecialistScreen.routeName);
              },
              child: Text(ConstantString.seeAll, style: subtitleStyle1),
            ),
            spacing: 0,
            childWidget: ListView.separated(
              shrinkWrap: true,
              primary: true,
              physics: ScrollPhysics(),
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

class AppointmentCard extends StatelessWidget {
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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 12),
                    Column(
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
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.home, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Home Visit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
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
                  ],
                ),
                SizedBox(height: 12),
                Row(
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
              ],
            ),
          ),
        ],
      ),
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
        CustomContainerWithText(
          text:ConstantString.visitLocalClinic ,
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
