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
import '../widgets/profile_image.dart';

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
        ProfileImage(
          initialImageUrl:
              'https://s3-alpha-sig.figma.com/img/df1c/b52e/f5e502e6fea97dabf492ab66036e7ec2?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=o5Buqz1bYL-0yvutHptCw9Q9Du~5NUyQg7hPUu~Up5hK5~2MlwWiNoXDE09ElYH1JGSj~Ck4JQUOZLqFwmwPwYTTRNzT0oeoaa2Ebms9K5Fx5kQHV9nVlmms6A-j2Ar10u4AbtL4ShTDFdA6WOa5uBWpoGPpUXANiqebyiDrTV9LWtz5oSds91yMhcU6l-YksInL8b9s4TKb9eb4MfXuvflFyRTn3Q3q5xSxsXFF-rghYf0hY0J0dV~ZdXGkIk50KZj5fJ50sY59U1Mn2AqxsKBcvoht0l8~RBfdFybpmbAW0k07XrNNufO2CqXsDA5hlAeenCneKfovS~4EBmLdPg__',
          isEditing: false,
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
        ProfileField(label: 'Zip Code', value: controller.zipController.text),
        ProfileField(label: 'State', value: controller.selectedState.value),
      ],
    );
  }
}
