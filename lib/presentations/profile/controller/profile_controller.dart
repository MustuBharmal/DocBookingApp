import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find<ProfileController>();

  RxBool isEditingProfile = RxBool(false);
  RxString imageUrl = RxString('');

  // Function to pick an image
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      imageUrl.value = pickedImage.path; // Update the reactive variable with the new image path
    }
  }

  // Country state (default is US)
  var selectedCountry = CountryParser.parseCountryCode('US').obs;

  // Phone number state
  var phoneNumber = ''.obs;


  RxString prefCommMethod = RxString('Whatsapp');


  final TextEditingController nameController = TextEditingController(text: 'Alex Doe');
  final TextEditingController emailController = TextEditingController(text: 'alex.doe@gmail.com');
  final TextEditingController phoneController = TextEditingController(text: '3455672356');
  final TextEditingController dobController = TextEditingController(text: '27/02/1992');
  final TextEditingController addressController = TextEditingController(text: 'Street 2334, New York');
  final TextEditingController zipController = TextEditingController(text: '53542');
  final TextEditingController messageController = TextEditingController(text: '');
  final List<String> stateList = ['Florida', 'New York', 'Los Angeles'];
  final List<String> sexOptions = ['Male', 'Female', 'Other'];
  final List<String> prefCommMethodList = ['Whatsapp', 'Telephone', 'Message'];
  final List<String> businessNamesList = ['Fitness First','Travelling','Psychology'];
  final List<String> businessTypesList = ['Clinic', 'Hospital','Small Hospital'];
  RxString selectedBusinessName = RxString('Fitness First');
  RxString selectedBusinessType = RxString('Clinic');
  RxString selectedState = RxString('New York');
  RxString selectedSex = RxString('Male');

  // Update phone number
  void updatePhoneNumber(String value) {
    phoneNumber.value = value;
  }

  // Update country
  void updateCountry(Country country) {
    selectedCountry.value = country;
  }

  // Get full phone number with country code
  String get fullPhoneNumber =>
      '+${selectedCountry.value.phoneCode} ${phoneNumber.value}';

}
