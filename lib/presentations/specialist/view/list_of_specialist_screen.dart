import 'package:doc_booking_app/presentations/home/widget/custom_search_textfield.dart';
import 'package:doc_booking_app/presentations/specialist/controller/specialist_controller.dart';
import 'package:doc_booking_app/presentations/specialist/widget/custom_search_textfield.dart';
import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../global/app_color.dart';
import '../../../widgets/custom_specialist_container.dart';

class ListOfSpecialistScreen extends StatelessWidget {
  const ListOfSpecialistScreen({super.key});

  static const routeName = '/listOfSpecialist-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Search", back: true),
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchTextfield(
                hintText: "Search by name",
                controller:
                    SpecialistController.instance.searchController.value,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 340,
                  height: 400,
                  child: ListView.separated(
                      physics: const ScrollPhysics(),
                      primary: true,
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return CustomSpecialistContainer(
                                name: "Divyesh",
                                specialist: "specialist",
                                charges: 10,
                                rating: 5,
                                review: 25,
                                onPressed: () {});
                          case 1:
                            return CustomSpecialistContainer(
                                name: "Mustafa",
                                specialist: "specialist",
                                charges: 10,
                                rating: 5,
                                review: 25,
                                onPressed: () {});
                          default:
                            return CustomSpecialistContainer(
                                name: "default",
                                specialist: "specialist",
                                charges: 10,
                                rating: 5,
                                review: 25,
                                onPressed: () {});
                        }
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: 3),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
