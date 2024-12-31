import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/booking/views/book_time_slot_screen.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_list.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
import 'package:doc_booking_app/widgets/custom_icon_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class SpecialistDetailScreen extends StatelessWidget {
  final DoctorsList doctor;
  final String serviceType;

  const SpecialistDetailScreen(
      {required this.doctor, this.serviceType = 'Clinic', super.key});

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
                    ),
                    child: CachedNetworkImage(
                      imageUrl: doctor.profilePic!,
                      fit: BoxFit.contain,
                      alignment: FractionalOffset.topCenter,
                      progressIndicatorBuilder: (context, val, pr) {
                        return Center(
                          child: CircularProgressIndicator(
                            value: pr.progress,
                          ),
                        );
                      },
                      errorWidget: (context, val, obj) {
                        return Image.asset(AppImage.serviceIcon1);
                      },
                    ),
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
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
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
                      Text(
                        doctor.name?.capitalizeFirst ?? '',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${doctor.fees}/hr',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    doctor.specialistData?.name?.capitalizeFirst ?? '',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textHeaderGray,
                    ),
                  ),
                  /*Container(
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
                  ),*/
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    ConstantString.about,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textHeaderBlack),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    // child: RichText(
                    //   maxLines: 5,
                    //   overflow: TextOverflow.ellipsis,
                    //   text: TextSpan(
                    //     text: doctor.about,
                    //     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textHeaderGray),
                    //   ),
                    // ),
                    child: Html(
                      data: doctor.about ?? '',
                    ),
                  ),
                  Text(
                    ConstantString.location,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textHeaderBlack,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomIconSizeBox(
                          iconPath: AppImage.map,
                          iconWidth: 25,
                          iconHeight: 25),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          doctor.address ?? '',
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textHeaderGray,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  /*CustomHeaderText(
                    text: ConstantString.review,
                    button: TextButton(
                        onPressed: () {
                          Get.toNamed(ReviewsScreen.routeName);
                        },
                        child:
                            Text(ConstantString.seeAll, style: subtitleStyle1)),
                  ),*/
                  /*Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CustomReviewCard(
                        name: "Virat Kohli",
                        imagePath: AppImage.user,
                        day: "2 d",
                        rating: 4,
                        review: "Nice it is very Useful for me."),
                  ),*/
                  SizedBox(
                    height: 20,
                  ),
                  BlueButton(
                    label: ConstantString.bookAppointment,
                    onPressed: () {
                      Get.toNamed(BookTimeSlotScreen.routeName, arguments: {
                        'doctor': doctor,
                        'serviceType': serviceType
                      });
                      // Get.toNamed(BookSlotsConfirmScreen.routeName);
                    },
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
