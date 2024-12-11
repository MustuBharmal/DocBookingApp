import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customSearchTextfield() {
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
      child: Row(
        children: [
          Row(
            children: [
              Image.asset("assets/images/Stethoscope.png", scale: 1),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_drop_down))
            ],
          ), // Replace with the stethoscope icon
          const SizedBox(width: 8),
          VerticalDivider(
            color: Colors.grey.shade300,
            thickness: 1,
            width: 1,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by service or location',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                border: InputBorder.none,
              ),
            ),
          ),
          // Dropdown arrow
        ],
      ),
    ),
  );
}

Widget myHeaderText({required String text, double? fontSize}) {
  return Text(
    text,
    style: TextStyle(
      color: const Color(0xFF363636),
      fontSize: fontSize ?? 16,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget customContainer({required String text}) {
  return Container(
    width: Get.width * 1,
    height: Get.height * 0.06,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFF0F0F0)),
        borderRadius: BorderRadius.circular(100),
      ),
    ),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF2268FF),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          height: 0,
        ),
      ),
    ),
  );
}

Widget containerWithImage({required String imagePath, required String text}) {
  return Container(
    width: 108.67,
    height: 122,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFF5F1FE)),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(imagePath),
        const SizedBox(height: 16),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF363636),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0.12,
          ),
        ),
      ],
    ),
  );
}

Widget customSpecialistContainer() {
  return  Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 4),
          blurRadius: 10,
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage("https://via.placeholder.com/60x60"),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFFF4F4F6)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Peater Parker",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "Psychiatrist",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 16,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "4.0",
                    style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "(24 Reviews)",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          "\$10/hr",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue),
        ),
      ],
    ),
  );
}
