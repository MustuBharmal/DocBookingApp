import 'dart:async';
import 'package:get/get.dart';

class OTPTimerController extends GetxController {
  var timerText = '1:00'.obs;
  late Timer _timer;
  int secondsRemaining = 60;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    secondsRemaining = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        timerText.value = formatTime(secondsRemaining);
      } else {
        timer.cancel();
        timerText.value = 'Resend';
      }
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void resetTimer() {
    _timer.cancel();
    startTimer();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
