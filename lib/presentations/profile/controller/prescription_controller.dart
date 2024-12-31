import 'dart:developer';
import 'dart:io';

import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../exception/server_exception.dart';
import '../../../util/log_utils.dart';
import '../../authentication/controller/authentication_controller.dart';
import '../../specialist/models/doctor_list.dart';
import '../models/message_model.dart';
import '../repo/profile_repo.dart';
import '../view/prescription_inside_screen.dart';

class PrescriptionController extends GetxController {

  // prescription inside data
  final TextEditingController chatController = TextEditingController();
  final TextEditingController symptomsController = TextEditingController();
  final TextEditingController bloodGrpController = TextEditingController();

  // Socket.IO instance
  late io.Socket socket;

  // Reactive list of messages
  RxList<MessageModel> messages = RxList.empty();
  DoctorsList? selectedDoctor;

  String? currDocId;
  RxMap<String, String> profileError = RxMap({});

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
  @override
  void onClose() {
    chatController.dispose();
    socket.dispose();
    super.onClose();
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
}
