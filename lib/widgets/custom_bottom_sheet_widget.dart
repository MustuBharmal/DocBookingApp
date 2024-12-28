import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/presentations/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../global/app_color.dart';
import '../global/images.dart';

class CustomBottomSheetWidget extends GetView<HomeController> {
  final String header;
  final List<String> listOfItems;
  final TextEditingController searchControllers;

  const CustomBottomSheetWidget({
    super.key,
    required this.header,
    required this.listOfItems,
    required this.searchControllers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 23),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: SizedBox(
        height: Get.height * 0.51,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  header,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textHeaderBlack),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    ConstantString.done,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: AppColors.borderColorLight,
              thickness: 2,
            ),
            Expanded(
              child: ListView.builder(
                physics: ScrollPhysics(),
                primary: true,
                shrinkWrap: true,
                itemCount: HomeController.instance.services.length,
                itemBuilder: (context, index) {
                  final item = HomeController.instance.services[index];
                  return Obx(() {
                    final isSelected =
                        controller.selectedService.value == item!.name;
                    return InkWell(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CachedNetworkImage(
                                      imageUrl: item.icon ?? '',
                                      fit: BoxFit.contain,
                                      progressIndicatorBuilder:
                                          (context, val, pr) {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: pr.progress,
                                          ),
                                        );
                                      },
                                      errorWidget: (context, val, obj) {
                                        return Image.asset(
                                            AppImage.serviceIcon1);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    item.name ?? '',
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.blue
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Radio(
                                value: item.name ?? '',
                                groupValue: HomeController
                                    .instance.selectedService.value,
                                activeColor: Colors.blue,
                                onChanged: (String? value) {
                                  controller.updateSelectedImage(item);
                                  controller.selectedService.value =
                                      item.name ?? '';
                                  searchControllers.text = item.name ?? '';
                                },
                              )
                            ],
                          ),
                          Divider(
                            color: AppColors.borderColorLight,
                            thickness: 1,
                          ),
                        ],
                      ),
                      onTap: () {
                        controller.updateSelectedImage(item);
                        controller.selectedService.value = item.name ?? '';
                        searchControllers.text = item.name ?? '';
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
