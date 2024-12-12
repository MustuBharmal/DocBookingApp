import 'package:flutter/material.dart';
import '../../../global/constant_list.dart';
import '../../../util/app_color.dart';
import '../../../util/images.dart';
import '../../../widgets/custom_container_with_logo.dart';
import '../../../widgets/custom_intro_container.dart';

class SpecialistScreen extends StatelessWidget {
  const SpecialistScreen({super.key});

  static const routeName = '/specialist-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customIntoContainer(imgPath: Images.femaleDoctor),
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
