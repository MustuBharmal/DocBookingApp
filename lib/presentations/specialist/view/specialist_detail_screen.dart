import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/widgets/custom_header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialistDetailScreen extends StatelessWidget {
  const SpecialistDetailScreen({super.key});

  static const routeName = '/specialist_detail-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.76,
                  child: Image.asset(
                    "assets/images/female_doctor2.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  top: Get.width * 0.14,
                  left: Get.width * 0.05,
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios_new)),
                  ))
            ]),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Peater Parker",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Psychiatrist",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "\$10/hr",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///for rating
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 24,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.only(left: 12.33),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Rating"),
                                const Text(
                                  "4.8 out of 5.0",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //for person
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.green,
                              size: 24,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.only(left: 12.33),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Patient"),
                                const Text(
                                  "500+",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomerHeaderText(text: "About"),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      text:
                          "Physical Medicine and Rehabilitation (PM&R) physicians, also known as physiatrists, treat a wide variety of medical conditions... ",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      children: [
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {},
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Text(
                                  "Read More",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    height: 1.5,
                                    // Thickness of the underline
                                    color: Colors.black,
                                    // Custom underline color
                                    width:
                                        65, // Adjust width based on text length
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomerHeaderText(text: "Location"),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "4517 Washington Ave. Manchester, Kentucky 39495",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomerHeaderText(text: "Review"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
