import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/global/extensions.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/profile/controller/profile_controller.dart';
import 'package:doc_booking_app/presentations/profile/view/user_info_edit_screen.dart';
import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../widgets/profile_field.dart';

class UserInfoScreen extends GetView<ProfileController> {
  static const routeName = '/user-info-screen';

  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        actions: [
          Container(
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.borderColor)),
            child: Center(
              child: SvgPicture.asset(
                AppImage.editIcon,
                height: 24,
                width: 24,
              ),
            ),
          ).onClick(() => Get.toNamed(UserInfoEditScreen.routeName))
          /*Icon(
            icon: Image.asset(AppImage.editProfile),
            onPressed: () {
              controller.isEditingProfile.toggle();
            },
          ),*/
        ],
        // controller: controller,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: _buildViewProfile(context),
      ),
    );
  }

  Widget _buildViewProfile(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: Get.width * .35,
          ),
          width: Get.width * .3,
          height: Get.height * .135,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            child: CachedNetworkImage(
              imageUrl: controller.imageUrl.value,
              fit: BoxFit.contain,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
          ),
        ),
        const SizedBox(height: 25),
        ProfileField(
          label: 'Full Name',
          value: controller.nameController.text,
        ),
        ProfileField(
            label: 'Email Address', value: controller.emailController.text),
        ProfileField(
            label: 'Phone Number', value: controller.phoneController.text),
        ProfileField(label: 'DOB', value: controller.dobController.text),
        ProfileField(label: 'Sex', value: controller.selectedSex.value),
        ProfileField(
            label: 'Address', value: controller.addressController.text),

        ProfileField(
            label: 'Country', value: controller.countryController.text),
        ProfileField(label: 'State', value: controller.stateController.text),
        ProfileField(label: 'City', value: controller.cityController.text),

        // ProfileField(label: 'Zip Code', value: controller.postCodeController.text),
      ],
    );
  }
}
