import 'package:doc_booking_app/presentations/home/widget/custom_widgets.dart';
import 'package:doc_booking_app/util/app_color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: AppColors.white,
              radius: 20,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.notifications)),
            ),
          )
        ],
        title: const Text("Home"),
        centerTitle: true,
      ),
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myHeaderText(text: 'Hello, John Doe', fontSize: 20),
              customTextfield(),
              const SizedBox(
                height: 10,
              ),
              myHeaderText(text: 'Upcoming Appointments'),
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
              myHeaderText(text: 'Book Now'),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: customContainer(text: "Visit a Local Clinic"),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: customContainer(text: "Arrange Home Visit"),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: customContainer(text: "Chat With a Specialist"),
              ),
              const SizedBox(
                height: 15,
              ),
              myHeaderText(text: "Top Services"),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    containerWithImage(
                        imagePath: "assets/images/Phlebotomy.png", text: "Phlebotomy"),
                    containerWithImage(imagePath: "assets/images/Vitamin_IV.png", text:"Vitamin IV"),
                    containerWithImage(imagePath: "assets/images/Vitamin Booster.png", text:"Vitamin IV"),
                    containerWithImage(imagePath: "assets/images/Vitamin_IV.png", text:"Vitamin IV"),
                    containerWithImage(imagePath: "assets/images/Vitamin_IV.png", text:"Vitamin IV"),
          
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              myHeaderText(text: "Top Rated Specialist"),


            ],
          ),
        ),
      ),
    );
  }
}
