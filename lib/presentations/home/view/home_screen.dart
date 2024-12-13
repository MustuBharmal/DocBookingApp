import 'package:doc_booking_app/presentations/home/widget/custom_search_textfield.dart';
import 'package:doc_booking_app/widgets/custom_container_with_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/app_color.dart';
import '../../../global/constant_values.dart';
import '../../../global/styles.dart';
import '../../../widgets/custom_container_with_logo1.dart';
import '../../../widgets/custom_specialist_container.dart';
import '../../specialist/view/list_of_specialist_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, John Doe",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            const CustomSearchTextField(
              hintText: 'Search by service or location',
            ),
            const SizedBox(
              height: 20,
            ),
            const SectionHeader(
              title: "Upcoming Appointments",
              spacing: 20,
              child: AppointmentCard(),
            ),
            const SizedBox(
              height: 20,
            ),
            const SectionHeader(
              title: "Book Now",
              spacing: 12,
              child: BookingOptions(),
            ),
            SectionHeader(
              title: "Top Services",
              button: TextButton(
                onPressed: () {},
                child: Text("See All", style: subtitleStyle1),
              ),
              spacing: 15,
              child: const ServiceListView(),
            ),
            SectionHeader(
              title: "Top Rated Specialists",
              button: TextButton(
                onPressed: () {
                  Get.toNamed(ListOfSpecialistScreen.routeName);
                },
                child: Text("See All", style: subtitleStyle1),
              ),
              spacing: 10,
              child: const SpecialistListView(),
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
  final Widget child;

  const SectionHeader({
    super.key,
    required this.title,
    this.button,
    required this.spacing,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            if (button != null) button!,
          ],
        ),
        SizedBox(height: spacing),
        child,
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
              width: Get.width*0.890,
              height: Get.height*0.215,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Container(
            width: Get.width*0.890,
            height: Get.height*0.210,
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
    return const Column(
      children: [
        CustomerContainerWithText(text: "Visit Local Clinic"),
        SizedBox(height: 10),
        CustomerContainerWithText(text: "Arrange Home Visit"),
        SizedBox(height: 10),
        CustomerContainerWithText(text: "Chat with Specialist"),
      ],
    );
  }
}

class ServiceListView extends StatelessWidget {
  const ServiceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 122,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ContainerWithIcon1(
            onPressed: () {},
            iconPath: ConstantValue.imagePathListForServices[index],
            text: ConstantValue.textListForServices[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 3,
      ),
    );
  }
}

class SpecialistListView extends StatelessWidget {
  const SpecialistListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: ListView.separated(
        physics: const ScrollPhysics(),
        primary: true,
        itemBuilder: (context, index) {
          return CustomSpecialistContainer(
            name: "Specialist $index",
            specialist: "Specialization",
            charges: 10,
            rating: 5,
            review: 25,
            onPressed: () {},
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: 3,
      ),
    );
  }
}
