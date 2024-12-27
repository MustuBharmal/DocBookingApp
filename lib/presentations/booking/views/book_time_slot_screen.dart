import 'package:doc_booking_app/global/extensions.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_list.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_time_table.dart';
import 'package:doc_booking_app/util/custom_date_utils.dart';
import 'package:doc_booking_app/util/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../global/app_color.dart';
import '../../../global/styles.dart';

class BookTimeSlotScreen extends StatefulWidget {
  static const String routeName = '/booking-time-slot';

  const BookTimeSlotScreen(this.doctorData, {super.key});

  final DoctorsList doctorData;

  @override
  State<BookTimeSlotScreen> createState() => _BookTimeSlotScreenState();
}

class _BookTimeSlotScreenState extends State<BookTimeSlotScreen> {
  DateTime today = CustomDateUtils.today;
  List<DateTime> thisWeek = CustomDateUtils.getThisWeekRange();
  DateTime selectedDate = CustomDateUtils.today;
  Map<DateTime, List<DoctorTimeTable>> timeTable = {};
  DoctorTimeTable? selectedTT;

  @override
  void initState() {
    super.initState();
    fillData();
  }

  void fillData() async {
    await Future.delayed(Duration.zero);
    LogUtil.debug(widget.doctorData.doctorTimeTable);
    for (var date in thisWeek) {
      timeTable[date] = widget.doctorData.doctorTimeTable.where((tt) {
        LogUtil.debug('${tt.day?.toLowerCase()}:::|||${DateFormat('EEEE').format(date).toLowerCase()}');
        return tt.day?.toLowerCase() == DateFormat('EEEE').format(date).toLowerCase();
      }).toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      thisWeek.length,
                      (index) {
                        return Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: selectedDate.isAtSameMomentAs(thisWeek[index]) ? AppColors.white : AppColors.transparent,
                                borderRadius: BorderRadius.circular(12)),
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              children: [
                                Text(
                                  CustomDateUtils.getDay(thisWeek[index]),
                                  style: TextStyle(
                                      color: selectedDate.isAtSameMomentAs(thisWeek[index])
                                          ? AppColors.primary
                                          : thisWeek[index].isBefore(today)
                                              ? AppColors.grey
                                              : AppColors.white),
                                ),
                                Text(
                                  CustomDateUtils.getDate(thisWeek[index]),
                                  style: TextStyle(
                                      color: selectedDate.isAtSameMomentAs(thisWeek[index])
                                          ? AppColors.primary
                                          : thisWeek[index].isBefore(today)
                                              ? AppColors.grey
                                              : AppColors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: timeTable[thisWeek[index]]?.isNotEmpty ?? false
                                          ? AppColors.selectedDotColor
                                          : AppColors.transparent),
                                  height: 6,
                                  width: 6,
                                )
                              ],
                            ),
                          ).onClick(() {
                            // if (!thisWeek[index].isBefore(today)) {
                            setState(() {
                              selectedDate = thisWeek[index];
                            });
                            // }
                          }),
                        );
                      },
                    ),
                  )
                  /*TableCalendar(
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
                  ),*/
                ],
              ),
            ),
          ),
          Text(' Time Slots'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 3, crossAxisSpacing: 10),
                itemBuilder: (ctx, index) {
                  final tt = timeTable[selectedDate]?[index];
                  if (tt == null) {
                    return Container();
                  }
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(100),
                      border: tt.id == selectedTT?.id
                          ? Border.all(color: AppColors.primary, width: 2)
                          : Border.all(color: AppColors.borderColorLight, width: 1),
                    ),
                    child: Center(child: Text(tt.startTime ?? '')),
                  ).onClick(() {
                    selectedTT = tt;
                    LogUtil.debug('${tt.id}||${selectedTT?.id}');
                    setState(() {});
                  });
                },
                itemCount: timeTable[selectedDate]?.length ?? 0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
