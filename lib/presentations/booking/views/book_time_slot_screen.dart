import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../global/app_color.dart';
import '../../../global/styles.dart';

class BookTimeSlotScreen extends StatefulWidget {
  static const String routeName = '/booking-time-slot';

  const BookTimeSlotScreen({super.key});

  @override
  State<BookTimeSlotScreen> createState() => _BookTimeSlotScreenState();
}

class _BookTimeSlotScreenState extends State<BookTimeSlotScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDayCurr = DateTime.now();
    DateTime focusedDayCurr = DateTime.now();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              TableCalendar(
                headerVisible: false,
                calendarFormat: CalendarFormat.week,
                focusedDay: selectedDayCurr,
                firstDay: focusedDayCurr,
                lastDay: DateTime(2030),
                holidayPredicate: (day) {
                  return isSameDay(focusedDayCurr, day);
                },
                calendarStyle: CalendarStyle(
                    defaultTextStyle: TextStyle(color: AppColors.white),
                    weekendTextStyle: TextStyle(color: AppColors.white),
                    outsideDaysVisible: false,
                    holidayDecoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    todayDecoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    selectedTextStyle: TextStyle(color: Colors.blue)),
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDayCurr, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    selectedDayCurr = selectedDay;
                    focusedDayCurr = focusedDay;
                    print(selectedDayCurr);
                  });
                },
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    color: AppColors.white,
                  ),
                  weekendStyle: TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
