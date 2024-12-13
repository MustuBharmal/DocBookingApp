import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/presentations/home/controller/home_controller.dart';
import 'package:doc_booking_app/presentations/home/widget/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/constant_values.dart';
import '../../../widgets/custom_specialist_container.dart';
import '../../../global/styles.dart';
import '../../../global/app_color.dart';
import '../../../widgets/custom_container_with_logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myHeaderText(text: 'Hello, John Doe', fontSize: 20),
              customSearchTextField(HomeController.instance),
              const SizedBox(
                height: 10,
              ),
              myHeaderText(text: ConstantString.upcomingAppointments),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 10,
                      child: Container(
                        width: 320,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Container(
                      width: 320,
                      height: 160,
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
                                  Icon(Icons.home,
                                      color: Colors.white, size: 20),
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
                                  Icon(Icons.access_time,
                                      color: Colors.white, size: 20),
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
                              Icon(Icons.calendar_today,
                                  color: Colors.white, size: 20),
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
              ),
              const SizedBox(
                height: 20,
              ),
              myHeaderText(text: ConstantString.bookNow),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: customContainer(text: ConstantString.visitLocalClinic),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: customContainer(text: ConstantString.arrHomeVisit),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: customContainer(text: ConstantString.chatWSpeciaList),
              ),
              const SizedBox(
                height: 15,
              ),
              myHeaderText(
                  text: ConstantString.topServices,
                  button: TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: subtitleStyle1,
                      ))),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 330,
                    height: 122,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return containerWithIcon1(
                              onTap: () {},
                              imagePath:
                                  ConstantValue.imagePathListForServices[index],
                              text: ConstantValue.textListForServices[index]);
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                        itemCount: 3),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              myHeaderText(
                  text: ConstantString.topRatedSpecialist,
                  button: TextButton(
                      onPressed: () {
                        // Get.to(() => const ListOfSpecialistScreen());
                      },
                      child: Text(
                        "See All",
                        style: subtitleStyle1,
                      ))),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 340,
                height: 400,
                child: ListView.separated(
                    physics: const ScrollPhysics(),
                    primary: true,
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return CustomSpecialistContainer(
                              name: "Divyesh",
                              specialist: "specialist",
                              charges: 10,
                              rating: 5,
                              review: 25,
                              onPressed: () {});
                        case 1:
                          return CustomSpecialistContainer(
                              name: "Mustafa",
                              specialist: "specialist",
                              charges: 10,
                              rating: 5,
                              review: 25,
                               onPressed: () {  },);
                        default:
                          return CustomSpecialistContainer(
                              name: "default",
                              specialist: "specialist",
                              charges: 10,
                              rating: 5,
                              review: 25,
                              onPressed: () {});
                      }
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemCount: 3),
              )
            ],
          ),
        ),
      ),
    );
  }
}
