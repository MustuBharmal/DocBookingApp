import 'package:doc_booking_app/presentations/specialist/controller/specialist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customSearchTextField() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: Get.width * 0.95,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: TextField(
        controller: SpecialistController.instance.searchController.value,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search by name',
          hintStyle: TextStyle(color: Colors.grey.shade500),
          border: InputBorder.none,
          isCollapsed: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    ),
  );
}
