import 'package:flutter/material.dart';

import '../global/app_color.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.tabText1, required this.tabText2});

  final String tabText1;
  final String tabText2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Material(
        color: Colors.transparent,
        elevation: 0, // Remove shadow
        child: TabBar(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          //for Remove background color when tap on button
          indicator: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColors.primary, width: 2),
          ),
          // padding: EdgeInsets.zero,

          indicatorColor: Colors.transparent,
          labelColor: AppColors.primary,
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
          // dividerColor: Colors.transparent,
          dividerHeight: 0,

          tabs: [
            /*Tab(
              child: Text(
                tabText1,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Tab(
              child: Text(
                tabText2,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),*/
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppColors.transparent, width: 2),
              ),
              margin: EdgeInsets.symmetric(vertical: 2,horizontal: 2),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 38),
              child: Text(
                tabText1,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppColors.transparent, width: 2),
              ),
              margin: EdgeInsets.symmetric(vertical: 2,horizontal: 2),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 38),
              child: Text(
                tabText2,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
