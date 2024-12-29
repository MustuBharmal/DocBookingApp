import 'package:dio/dio.dart' as dio;
import 'package:doc_booking_app/exception/server_exception.dart';
import 'package:doc_booking_app/global/apis.dart';
import 'package:doc_booking_app/presentations/booking/models/booking_response.dart';
import 'package:doc_booking_app/service/http_service.dart';
import 'package:doc_booking_app/util/log_utils.dart';

abstract class BookingRepo {
  static const String _patientId = 'patient_id';
  static const String _doctorId = 'doctor_id';
  static const String _doctorTimeTableId = 'doctor_time_table_id';
  static const String _amount = 'amount';
  static const String _paymentType = 'payment_type';
  static const String _paymentCardId = 'payment_card_id';

  // login is working
  static Future<BookingData?> getPaymentSecret(String patientId, String doctorId, String doctorTimeTableId, String amount) async {
    try {
      final Map<String, dynamic> data = {
        // "patient_id": "34",
        // "doctor_id": "6",
        // "doctor_time_table_id": "17",
        // "amount": "100",
        // "payment_type": "1",
        // "payment_card_id": "1"
        _patientId: patientId,
        _doctorId: doctorId,
        _doctorTimeTableId: doctorTimeTableId,
        _amount: amount,
        _paymentType: '1',
        _paymentCardId: '1'
      };
      final result = await HttpService.post(Api.booking, data);
      LogUtil.debug(data);
      LogUtil.debug(result);
      if (result['isLive'] == true) {
        final response = BookingResponse.fromJson(result);
        if (response.success) {
          return response.data;
        }
      } else if (result['isLive'] == false) {
        throw Exception("${result['data']['error']}");
      } else {
        throw Exception("${result['data']['error']}");
      }
    } on ServerException catch (e) {
      LogUtil.error(e);
      rethrow;
    } catch (e) {
      if (e is dio.DioException) {
        final errData = (e).response!.data;
        final String? errMessage = errData['message']?.toString();
        throw errMessage ?? 'Please try again';
      }
      rethrow;
    }
    return null;
  }
}
