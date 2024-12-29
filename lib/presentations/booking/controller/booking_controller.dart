import 'package:doc_booking_app/presentations/specialist/models/doctor_list.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_time_table.dart';
import 'package:doc_booking_app/util/custom_date_utils.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingController extends GetxController {
  static BookingController get instance => Get.find<BookingController>();
  DateTime today = CustomDateUtils.today;
  List<DateTime> thisWeek = CustomDateUtils.getNext7DaysRange();
  Rx<DateTime> selectedDate = Rx(CustomDateUtils.today);
  RxMap<DateTime, List<DoctorTimeTable>> timeTable = RxMap();
  Rx<DoctorTimeTable?> selectedTT = Rx(null);
  DoctorsList? doctorData;

  void fillData(DoctorsList doctor) async {
    doctorData = doctor;
    if (doctorData != null) {
      for (var date in thisWeek) {
        final timeSlots = doctorData!.doctorTimeTable.where((tt) {
          return tt.day?.toLowerCase() == DateFormat('EEEE').format(date).toLowerCase();
        }).toList();
        List<DoctorTimeTable>allSlots=[];
        allSlots.addAll(timeSlots);
        allSlots.addAll(timeSlots);
        allSlots.addAll(timeSlots);
        allSlots.addAll(timeSlots);
        timeTable[date] = allSlots;
      }
    }
  }
}
