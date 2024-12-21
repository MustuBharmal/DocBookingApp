// import 'package:country_picker/country_picker.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find<ProfileController>();
  RxBool isEditingProfile = RxBool(false);
  RxString imageUrl = RxString('');

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final List<String> stateList = ['Florida', 'New York', 'Los Angeles'];
  final List<String> sexOptions = ['Male', 'Female', 'Other'];
  final List<String> prefCommMethodList = ['Whatsapp', 'Telephone', 'Message'];
  final List<String> businessNamesList = [
    'Fitness First',
    'Travelling',
    'Psychology'
  ];
  final List<String> businessTypesList = [
    'Clinic',
    'Hospital',
    'Small Hospital'
  ];
  RxString selectedBusinessName = RxString('Fitness First');
  RxString selectedBusinessType = RxString('Clinic');
  RxString selectedState = RxString('New York');
  RxString selectedSex = RxString('Male');
  RxString selectedCountry = RxString('');
  RxString selectedCity = RxString('');

  // Function to pick an image
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      imageUrl.value = pickedImage
          .path; // Update the reactive variable with the new image path
    }
  }

  // Country state (default is US)
  // var selectedCountry = CountryParser.parseCountryCode('US').obs;

  // Phone number state
  RxString phoneNumber = RxString('');

  RxString prefCommMethod = RxString('Whatsapp');
  final List<String> faqQuestions = [
    'How do I book an appointment with a specialist?',
    'How do I cancel an appointment?',
    'What payment methods are accepted?',
    'Is there a consultation fee?',
    'How do I reschedule an appointment?',
    'How do I contact customer support?',
    'How do I create an account?',
  ];
  final List<String> faqAnswers = [
    'To book an appointment with a specialist, navigate to the "Book Appointment" section, select your preferred specialist, and follow the prompts to confirm your booking.',
    'You can cancel an appointment by going to the "My Appointments" section, selecting the appointment you wish to cancel, and tapping on the "Cancel Appointment" option.',
    'We accept various payment methods, including credit/debit cards, net banking, and popular digital wallets like Google Pay, PayPal, and others.',
    'Yes, there is a consultation fee that varies based on the specialist. The fee details will be displayed before you confirm the appointment.',
    'To reschedule an appointment, go to the "My Appointments" section, select the appointment, and choose the "Reschedule" option. Follow the instructions to pick a new date and time.',
    'To contact customer support, go to the "Help & Support" section in the app. You can either use the live chat feature or email our support team directly.',
    'Creating an account is simple. Open the app, click on "Sign Up," and provide the required details such as name, email, phone number, and password.',
  ];
  List<bool> expanded = [];


  // prescription inside data

  final TextEditingController chatController = TextEditingController();
  final TextEditingController symptomsController = TextEditingController();
  final TextEditingController bloodGrpController = TextEditingController();

  @override
  onInit() {
    super.onInit();
    initializeControllers();
    expanded = List.filled(faqQuestions.length, false);
  }

  initializeControllers() {
    final user = AuthController.instance.user.value;
    nameController.text = user?.name ?? '';
    emailController.text = user?.email ?? '';
    dobController.text = user?.dob ?? '';
    addressController.text = user?.address ?? '';
    phoneController.text = user?.phone ?? '';
    selectedSex.value = user?.sex ?? '';
    selectedState.value = user?.state ?? '';
    selectedCity.value = user?.city ?? '';
    selectedCountry.value = user?.country ?? '';
  }

  RxList<String> messages = [
    'Please avoid junk food and sugar drinks. Keep yourself stress-free.',
    "Yes, I will try my best to avoid it, but sometimes it's so hard!"
  ].obs;

  // Add message to the list
  void addMessage(String message) {
    if (message.isNotEmpty) {
      messages.add(message);
    }
  }

  // Update phone number
  void updatePhoneNumber(String value) {
    phoneNumber.value = value;
  }

  // toggle faq questions expansion
  void toggleExpansion(int index) {
    expanded[index] = !expanded[index];
    update();
  }

// Update country
// void updateCountry(Country country) {
//   // selectedCountry.value = country;
// }

// Get full phone number with country code
// String get fullPhoneNumber =>
//     '+${selectedCountry.value.phoneCode} ${phoneNumber.value}';
}
