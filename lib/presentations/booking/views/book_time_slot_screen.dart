import 'package:doc_booking_app/global/extensions.dart';
import 'package:doc_booking_app/presentations/booking/controller/booking_controller.dart';
import 'package:doc_booking_app/util/custom_date_utils.dart';
import 'package:doc_booking_app/util/log_utils.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/app_color.dart';
import '../../../global/styles.dart';

class BookTimeSlotScreen extends GetView<BookingController> {
  static const String routeName = '/booking-time-slot';

  const BookTimeSlotScreen(/*this.doctorData, */ {super.key});

  /*@override
  State<BookTimeSlotScreen> createState() => _BookTimeSlotScreenState();
}

class _BookTimeSlotScreenState extends State<BookTimeSlotScreen> {*/

  /* @override
  void initState() {
    super.initState();
    fillData();
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: BlueButton(
          label: 'Confirm Appointment',
          onPressed: controller.confirmBooking,
        ),
      ),
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.blueGradient2,
                    AppColors.blueGradient3,
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.white,
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.arrow_back_ios_new),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * .2,
                        ),
                        Text(
                          'Book Appointment',
                          style: subtitleStyle.copyWith(color: AppColors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      spacing: 10,
                      children: List.generate(
                        controller.thisWeek.length,
                        (index) {
                          return Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: controller.selectedDate.value
                                          .isAtSameMomentAs(
                                              controller.thisWeek[index])
                                      ? AppColors.white
                                      : AppColors.transparent,
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                children: [
                                  Text(
                                    CustomDateUtils.getDay(
                                        controller.thisWeek[index]),
                                    style: TextStyle(
                                        color: controller.selectedDate.value
                                                .isAtSameMomentAs(
                                                    controller.thisWeek[index])
                                            ? AppColors.primary
                                            : controller.thisWeek[index]
                                                    .isBefore(controller.today)
                                                ? AppColors.grey
                                                : AppColors.white),
                                  ),
                                  Text(
                                    CustomDateUtils.getDate(
                                        controller.thisWeek[index]),
                                    style: TextStyle(
                                        color: controller.selectedDate.value
                                                .isAtSameMomentAs(
                                                    controller.thisWeek[index])
                                            ? AppColors.primary
                                            : controller.thisWeek[index]
                                                    .isBefore(controller.today)
                                                ? AppColors.grey
                                                : AppColors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: controller
                                                    .timeTable[controller
                                                        .thisWeek[index]]
                                                    ?.isNotEmpty ??
                                                false
                                            ? AppColors.selectedDotColor
                                            : AppColors.transparent),
                                    height: 6,
                                    width: 6,
                                  )
                                ],
                              ),
                            ).onClick(() {
                              // if (!thisWeek[index].isBefore(today)) {
                              // setState(() {
                              controller.selectedDate.value =
                                  controller.thisWeek[index];
                              // });
                              // }
                            }),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                ' Time Slots',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                // shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (ctx, index) {
                  final tt = controller.timeTable[controller.selectedDate.value]
                      ?[index];
                  if (tt == null) {
                    return Container();
                  }
                  return Obx(
                    () => Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(100),
                        border: tt.id == controller.selectedTT.value?.id
                            ? Border.all(color: AppColors.primary, width: 2)
                            : Border.all(
                                color: AppColors.borderColorLight, width: 1),
                      ),
                      child: Center(child: Text(tt.startTime ?? '')),
                    ).onClick(() {
                      controller.selectedTT.value = tt;
                      LogUtil.debug(
                          '${tt.id}||${controller.selectedTT.value?.id}');
                      // setState(() {});
                    }),
                  );
                },
                itemCount: controller
                        .timeTable[controller.selectedDate.value]?.length ??
                    0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
