import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialistController extends GetxController {
  static SpecialistController get instance => Get.find<SpecialistController>();
  var searchController = TextEditingController().obs;
  var specialists = <Specialist>[].obs;
  var filteredSpecialists = <Specialist>[].obs;

  @override
  void onInit() {
    super.onInit();
    specialists.value = [
      Specialist(
          name: "Divyesh",
          specialist: "specialist",
          charges: 10,
          rating: 5,
          review: 25),
      Specialist(
          name: "Mustafa",
          specialist: "specialist",
          charges: 10,
          rating: 5,
          review: 25),
      Specialist(
          name: "John",
          specialist: "specialist",
          charges: 10,
          rating: 5,
          review: 25),
    ];
    filteredSpecialists.value = specialists;
    searchController.value.addListener(() {
      filterSpecialists();
    });
  }

  void filterSpecialists() {
    String query = searchController.value.text.toLowerCase();
    if (query.isEmpty) {
      filteredSpecialists.value = specialists;
    } else {
      filteredSpecialists.value = specialists
          .where((specialist) => specialist.name.toLowerCase().contains(query))
          .toList();
    }
  }
}

class Specialist {
  final String name;
  final String specialist;
  final int charges;
  final double rating;
  final int review;

  Specialist({
    required this.name,
    required this.specialist,
    required this.charges,
    required this.rating,
    required this.review,
  });
}
