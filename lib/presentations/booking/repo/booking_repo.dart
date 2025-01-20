import 'package:dio/dio.dart' as dio;
import 'package:doc_booking_app/exception/server_exception.dart';
import 'package:doc_booking_app/global/apis.dart';
import 'package:doc_booking_app/presentations/booking/models/booking_details_response.dart';
import 'package:doc_booking_app/presentations/booking/models/booking_response.dart';
import 'package:doc_booking_app/service/http_service.dart';
import 'package:doc_booking_app/util/log_utils.dart';

abstract class BookingRepo {
  static const String _patientId = 'patient_id';

  // static const String _doctorId = 'doctor_id';
  static const String _doctorTimeTableId = 'doctor_time_table_id';
  static const String _amount = 'amount';
  static const String _paymentType = 'payment_type';
  static const String _paymentCardId = 'payment_card_id';
  static const String _bookingId = 'booking_id';

  static Future<BookingData?> getPaymentSecret(
      String type,
      String patientId,
      String doctorId,
      String doctorTimeTableId,
      String amount,
      String doctorType,
      String bookingDate) async {
    try {
      final Map<String, dynamic> data = {
        _patientId: patientId,
        type == 'doctor' ? 'doctor_id' : 'clinic_id': doctorId,
        _doctorTimeTableId: doctorTimeTableId,
        _amount: amount,
        _paymentType: '1',
        _paymentCardId: '1',
        'booking_date_time': bookingDate,
        'booking_type': doctorType
      };
      LogUtil.debug(data);
      final result =
          await HttpService.post(Api.booking, data, showLoader: false);

      LogUtil.debug(result);
      if (result['isLive'] == true) {
        final response = BookingResponse.fromJson(result);
        if (response.success) {
          LogUtil.debug(response.data);
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

  static Future<BookingDetailsData?> getBookingDetails(String bookingId) async {
    try {
      final Map<String, dynamic> data = {_bookingId: bookingId};
      LogUtil.debug(data);
      final result =
          await HttpService.post(Api.bookingDetails, data, showLoader: false);
      if (result['isLive'] == true) {
        LogUtil.debug(result);
        final response = BookingDetailsResponse.fromJson(result);
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
