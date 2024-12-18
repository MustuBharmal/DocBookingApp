import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/review/view/reviews_screen.dart';
import 'package:doc_booking_app/presentations/specialist/widget/custom_review_card.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
import 'package:doc_booking_app/widgets/custom_header_text.dart';
import 'package:doc_booking_app/widgets/custom_icon_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/styles.dart';

class SpecialistDetailScreen extends StatelessWidget {
  const SpecialistDetailScreen({super.key});

  static const routeName = '/specialist_detail-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                //Doctor Image
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          alignment: FractionalOffset.topCenter,
                          image: AssetImage(AppImage.femaleDoctor2),
                        )),
                  ),
                ),
                //Back Icon Button
                Positioned(
                  top: Get.width * 0.14,
                  left: Get.width * 0.05,
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new)),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                      Text(
                        "\$10/hr",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Row(
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
                                    color: Color(0x99E8E8F2),
                                    blurRadius: 24.67,
                                    offset: Offset(0, 4.93),
                                    spreadRadius: 0,
                                  )
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
                              padding: const EdgeInsets.only(left: 12.33),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(ConstantString.rating),
                                  Text(
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
                                    color: Color(0x99E8E8F2),
                                    blurRadius: 24.67,
                                    offset: Offset(0, 4.93),
                                    spreadRadius: 0,
                                  )
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
                              padding: const EdgeInsets.only(left: 12.33),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(ConstantString.patient),
                                  Text(
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
                  ),
                  const CustomHeaderText(text: ConstantString.about),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 16),
                    child: RichText(
                      text: TextSpan(
                        text:
                            "Physical Medicine and Rehabilitation (PM&R) physicians, also known as physiatrists, treat a wide variety of medical conditions... ",
                        style: normalTextStyle,
                        children: [
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {},
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  const Text(
                                    ConstantString.readMore,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      height: 1.5,
                                      color: Colors.black,
                                      width: 65,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const CustomHeaderText(
                    text: ConstantString.location,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomIconSizeBox(
                          iconPath: AppImage.mapOutline,
                          iconWidth: 25,
                          iconHeight: 25),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "4517 Washington Ave. Manchester, Kentucky 39495",
                          style: normalTextStyle,
                        ),
                      ),
                    ],
                  ),
                  CustomHeaderText(
                    text: ConstantString.review,
                    button: TextButton(
                        onPressed: () {
                          Get.toNamed(ReviewsScreen.routeName);
                        },
                        child:
                            Text(ConstantString.seeAll, style: subtitleStyle1)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CustomReviewCard(
                        name: "Virat Kohli",
                        imagePath: AppImage.user,
                        day: "2 d",
                        rating: 4,
                        review: "Nice it is very Useful for me."),
                  ),
                  BlueButton(
                    label: ConstantString.bookAppointment,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
