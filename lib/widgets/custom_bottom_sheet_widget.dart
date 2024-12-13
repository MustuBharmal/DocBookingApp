import 'package:doc_booking_app/global/constant_values.dart';
import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/presentations/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheetWidget extends GetView<HomeController> {
  final String header;
  final List<String> listOfItems;
  final TextEditingController controllers;

  const CustomBottomSheetWidget({
    super.key,
    required this.header,
    required this.listOfItems,
    required this.controllers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SizedBox(
        width: double.infinity,
        height: Get.height * 0.55,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  header,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    ConstantString.done,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listOfItems.length,
                itemBuilder: (context, index) {
                  String item = listOfItems[index];
                  return Obx(() {
                    final isSelected = controller.selectedService.value == item;
                    return ListTile(
                      leading: SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          ConstantValue.imagePathListForServices[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: Text(
                        item,
                        style: TextStyle(
                          color: isSelected ? Colors.blue : Colors.black,
                        ),
                      ),
                      trailing: Radio(
                        value: item,
                        groupValue: controller.selectedService.value,
                        activeColor: Colors.blue,
                        onChanged: (String? value) {
                          controller.updateSelectedImage(value!);
                          controller.selectedService.value = value;
                          Navigator.pop(context);
                        },
                      ),
                      onTap: () {
                        controller.updateSelectedImage(item);
                        controller.selectedService.value = item;
                        Navigator.pop(context);
                      },
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
