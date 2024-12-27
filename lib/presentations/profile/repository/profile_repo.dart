abstract class ProfileRepo{
  static const String _patientId = 'patient_id';
  static const String _doctorId = 'doctor_id';
  static const String _bloodGroup = 'blood_group';
  static const String _symptoms = 'symptoms';


  /*static Future<void>(String bloodGrp , String symptoms) async {
    try {
      final Map<String, dynamic> data = {
  _patientId: '2',
  _doctorId: '1',
  _bloodGroup: bloodGrp,
  _symptoms : symptoms,

      };
      LogUtil.debug(Api.otpVerification);
      final result = await HttpService.post(Api.otpVerification, data);
      if (result['isLive'] == true) {
        LogUtil.debug(result);
        Get.snackbar('Success', result['message'].toString());
        return User.fromJson(result['data']);
      } else {
        throw Exception("Error: ${result['status']}");
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
  }*/


}