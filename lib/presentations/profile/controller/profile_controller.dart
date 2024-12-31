import 'dart:developer';
import 'dart:io';

import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/profile/models/faq_model.dart';
import 'package:doc_booking_app/presentations/profile/models/message_model.dart';
import 'package:doc_booking_app/presentations/profile/repo/profile_repo.dart';
import 'package:doc_booking_app/presentations/profile/view/prescription_inside_screen.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_list.dart';
import 'package:doc_booking_app/util/log_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../../exception/server_exception.dart';
import '../../authentication/models/city_model.dart';
import '../../authentication/models/country_model.dart';
import '../../authentication/models/state_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find<ProfileController>();
  RxString imageUrl = RxString('');
  RxBool isEditingProfile = RxBool(false);
  RxMap<String, String> profileError = RxMap({});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final TextEditingController messageController = TextEditingController();
  final TextEditingController businessTypeController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  Rx<CountryModel?> selectCountry = Rx(null);
  Rx<StateModel?> selectState = Rx(null);
  Rx<CityModel?> selectCity = Rx(null);
  final ImagePicker _picker = ImagePicker();
  RxList<FaqModels?> listOfFaqs = RxList.empty();
  final List<String> prefCommMethodList = ['Whatsapp', 'Telephone', 'Message'];
  final List<String> businessNamesList = [
    'Fitness First',
    'Travelling',
    'Psychology'
  ];
  final List<String> businessTypesList = [
    'Clinic',
    'Hospital',
    'Small Hospital'
  ];
  RxString selectedBusinessName = RxString('Fitness First');
  RxString selectedBusinessType = RxString('Clinic');
  RxString selectedSex = RxString('');
  Rx<File?> selectedImage = Rx<File?>(null);
  String? currDocId;

  // Function to pick an image
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  // Country state (default is US)
  // var selectedCountry = CountryParser.parseCountryCode('US').obs;

  // Phone number state
  RxString phoneNumber = RxString('');

  RxString prefCommMethod = RxString('Whatsapp');

  // prescription inside data

  final TextEditingController chatController = TextEditingController();
  final TextEditingController symptomsController = TextEditingController();
  final TextEditingController bloodGrpController = TextEditingController();

  // Socket.IO instance
  late io.Socket socket;

  // Reactive list of messages
  RxList<MessageModel> messages = RxList.empty();
  DoctorsList? selectedDoctor;

  @override
  onInit() {
    super.onInit();
    initializeControllers();
    getFaq();
  }

  @override
  void onClose() {
    chatController.dispose();
    socket.dispose();
    super.onClose();
  }

  initializeControllers() {
    final user = AuthController.instance.user.value;
    imageUrl.value = user?.profilePic ??
        'https://s3-alpha-sig.figma.com/img/df1c/b52e/f5e502e6fea97dabf492ab66036e7ec2?Expires=1736121600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=K6IBc34oEZTfO2Fvozs1V5mOGqff6iQ2VdibX-AVW1PEa-NINVvXbtyW5GxTiM-QilLtF4umNkGK2I~ycyoL84ObJnkXqjSPG66CQxqe96IKYWBErFu5TyFkq8QbmKCBDTrbM5HGJjslognO0Zh4pqVrtsDaHVk0uNmXnBpDXJ0uPZTB~DXwEnhdGGQtbC6RAnSuSz87v5Xk80wePKvHneKP3q--U7rUvmY3oZ4-mi8K4uoVZ-3CVPpkVyx6ikPIkmQQStKqsjAgwUzzqEttW~apbi2TkvOP8rBmOralmwU8-bHRxltyYVxMRL9EuGHL2wJ9np7mcf34G1WgQKRing__';
    selectedSex.value = user!.sex!;

    nameController.text = user.name ?? '';
    emailController.text = user.email ?? '';
    dobController.text = user.dob ?? '';
    addressController.text = user.address ?? '';
    phoneController.text = user.phone ?? '';
    selectedSex.value = user.sex ?? '';
    cityController.text = user.city ?? '';
    countryController.text = user.country ?? '';
    stateController.text = user.state ?? '';
    pinCodeController.text = user.pinCode ?? '';
  }

  void initializeSocketConnection(DoctorsList doctor) {
    const String socketUrl = 'https://crazylense.com';
    const String socketPath = '/applicationinterface-socket';
    selectedDoctor = doctor;

    socket = io.io(socketUrl, <String, dynamic>{
      'path': socketPath,
      'transports': ['websocket'],
      'query': {'debug': true},
      'reconnection': true,
      'reconnectionAttempts': 5,
      'reconnectionDelay': 1000,
      'reconnectionDelayMax': 5000,
    });

    // Listen for connection events
    socket.onConnect((_) {
      socket.emit('setup', {'user_id': AuthController.instance.user.value!.id});
      socket.emit('get_message', {
        'doctor_id': selectedDoctor?.id,
        'patient_id': AuthController.instance.user.value!.id,
      });
      currDocId = selectedDoctor?.id.toString();
      Get.toNamed(PrescriptionInsideScreen.routeName);
    });

    // Listen for disconnection events
    socket.onDisconnect((_) {
      print('Disconnected from server');
    });

    // Handle reconnection attempts
    socket.on('reconnect_attempt', (attempt) {
      print('Reconnection Attempt #$attempt');
    });

    // Handle reconnection success
    socket.on('reconnect', (_) {
      print('Reconnected to the server');
    });

    // Handle reconnection failure
    socket.on('reconnect_failed', (_) {
      print('Reconnection failed');
    });

    // Listen for connection errors
    socket.onConnectError((error) {
      print('Connection Error: $error');
    });

    // Listen for incoming messages
    socket.on('get_message_response', (data) {
      if (data is List) {
        messages.clear();
        // final List<Map<String, dynamic>> listOfMessage = data as List<Map<String, dynamic>>;
        List<MessageModel> fetched = [];
        for (var msg in data) {
          final message = MessageModel.fromJson(msg);
          fetched.add(message);
        }
        fetched.sort((a, b) {
          DateTime? dateA = DateTime.tryParse(a.createdAt ?? '');
          DateTime? dateB = DateTime.tryParse(b.createdAt ?? '');
          if (dateA != null && dateB != null) {
            return dateA.compareTo(dateB);
          } else {
            return 0;
          }
        });
        messages.addAll(fetched.reversed);
      } else {
        log(data);
      }
      // if (data != null && data['message'] != null) {
      //   messages.add(data['message']);
      // }
    });

    socket.onAny((event, data) {
      LogUtil.debug(event);
      LogUtil.debug(data.runtimeType);
      log(data.toString());
    });
  }

  void sendMessage(String message) {
    if (message.trim().isNotEmpty) {
      // Emit the message to the server
      final msg = {
        'message': message,
        'doctor_id': selectedDoctor?.id,
        'patient_id': AuthController.instance.user.value!.id,
        'sent_by': 'patient',
      };

      socket.emit('sendMessage', msg);
      // messages.add(MessageModel(message: message, sentBy: 'patient'));
      // Add the sent message to the local list
      // messages.add('You: $message');
    }
  }

  disconnectSocket() async {
    messages.clear();
    socket.disconnect();
    socket.dispose();
  }

  @override
  void dispose() {
    disconnectSocket();
    super.dispose();
  }

  // Update phone number
  void updatePhoneNumber(String value) {
    phoneNumber.value = value;
  }

  // get faq
  void getFaq() async {
    try {
      listOfFaqs.value = await ProfileRepo.getFaqs();
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  // contact us
  void contactUs(Map<String, dynamic> params) async {
    try {
      await ProfileRepo.contactUsApi(params);
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  void updateProfile(Map<String, dynamic> params) async {
    try {
      await ProfileRepo.updateProfileApi(params);
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  bool userEditProfileValidation() {
    if (nameController.text.isEmpty) {
      profileError['name'] = 'Please enter name';
    }
    if (emailController.text.isEmpty) {
      profileError['email'] = 'Please enter email';
    }
    if (dobController.text.isEmpty) {
      profileError['dob'] = 'Please enter Date of birth!';
    }
    if (selectedSex.isEmpty) {
      profileError['sex'] = 'Please select gender!';
    }
    if (stateController.text.isEmpty) {
      profileError['state'] = 'Please select state!';
    }
    if (countryController.text.isEmpty) {
      profileError['country'] = 'Please select country!';
    }
    if (cityController.text.isEmpty) {
      profileError['city'] = 'Please select city!';
    }
    if (addressController.text.isEmpty) {
      profileError['address'] = 'Please enter address!';
    }
    if (pinCodeController.text.isEmpty) {
      profileError['pin_code'] = 'Please Postal Code!';
    }
    if (imageUrl.isEmpty) {
      profileError['profile_pic'] = 'Please select image';
    }
    return profileError.isEmpty;
  }

  bool contactUsValidation() {
    profileError.clear();
    if (nameController.text.isEmpty) {
      profileError['name'] = 'Please enter name';
    }
    if (emailController.text.isEmpty) {
      profileError['email'] = 'Please enter email';
    }
    if (phoneController.text.isEmpty) {
      profileError['phone'] = 'Please enter phone';
    }
    if (prefCommMethod.isEmpty) {
      profileError['communication_method'] = 'Please enter business_type';
    }
    if (messageController.text.isEmpty) {
      profileError['message'] = 'Please enter message';
    }
    return profileError.isEmpty;
  }

  // how to be a partner
  void howToBePartner(Map<String, dynamic> params) async {
    try {
      await ProfileRepo.howToBePartner(params);
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  // prescription form api
  void prescriptionForm(Map<String, dynamic> params) async {
    try {
      await ProfileRepo.prescriptionForm(params);
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  bool prescriptionFormValidation() {
    profileError.clear();

    if (bloodGrpController.text.isEmpty) {
      profileError['blood_group'] = 'Please enter blood group';
    }
    if (symptomsController.text.isEmpty) {
      profileError['symptoms'] = 'Please enter symptoms';
    }
    return profileError.isEmpty;
  }

  bool htbValidation() {
    profileError.clear();

    if (nameController.text.isEmpty) {
      profileError['name'] = 'Please enter name';
    }
    if (emailController.text.isEmpty) {
      profileError['email'] = 'Please enter email';
    }
    if (phoneController.text.isEmpty) {
      profileError['phone'] = 'Please enter phone';
    }
    if (businessNameController.text.isEmpty) {
      profileError['business_name'] = 'Please enter business name';
    }
    if (businessTypeController.text.isEmpty) {
      profileError['business_type'] = 'Please enter business type';
    }
    return profileError.isEmpty;
  }
}
