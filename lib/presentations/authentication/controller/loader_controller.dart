import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoaderController extends GetxController {
  static LoaderController get instance => Get.find<LoaderController>();
  static bool isLoaderShow = false;
  Rx<Error> error = Error().obs;

  void showLoader() async {
    isLoaderShow = true;
    await Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: true);
    isLoaderShow = false;
  }

  void dismissLoader() {
    // if (isLoaderShow) {
    //   Get.closeAllSnackbars();
    Get.back(closeOverlays: false, canPop: false);
  }

/*void showError({String title = "Alert!", String? msg}) {
    if (isLoaderShow) {
      dismissLoader();
    }
    if (msg != null) Get.snackbar(title, msg);
  }

  void setError({ErrorType? errorType}) {
    error.value.errorType = errorType!;
    error.refresh();
  }*/
}
