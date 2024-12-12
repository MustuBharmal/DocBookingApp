import 'package:doc_booking_app/global/constant_list.dart';
import 'package:doc_booking_app/util/app_color.dart';
import 'package:doc_booking_app/widgets/custom_intro_container.dart';
import 'package:flutter/material.dart';
import '../../../util/images.dart';
import '../../../widgets/custom_container_with_logo.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  static const routeName = '/service-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customIntoContainer(imgPath: Images.maleDoctor),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 340,
                height: 500,
                child: GridView.builder(
                  physics:  const ScrollPhysics(),
                  primary: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: ConstantList.textList.length,
                  itemBuilder: (context, index) {
                    return containerWithLogo1(
                      imagePath: ConstantList.imagePathList[index],
                      text: ConstantList.textList[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
