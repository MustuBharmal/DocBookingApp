abstract class AppImage {
  ///logos
  static String get companyLogo => 'company_logo'.logoPng;

  ///images

  static String get femaleDoctor2 => 'female_doctor2'.jpeg;

  ///icons
  static String get bloodletting => 'bloodletting'.iconPng;

  static String get fluShots => 'flushots'.iconPng;

  static String get home => 'home'.iconPng;

  static String get signUpCamera => 'sign_up_camera'.iconPng;

  static String get user => 'user'.iconPng;

  static String get aboutUs => 'about_us'.iconPng;

  static String get contactUs => 'contact_us'.iconPng;

  static String get paymentCard => 'payment_card'.iconPng;

  static String get prescription => 'prescription'.iconPng;

  static String get profile2User => 'profile_2_user'.iconPng;

  static String get faq => 'faq'.iconPng;

  static String get userMyProfile => 'user_my_profile'.iconPng;

  static String get arrowLeft => 'arrow_left'.iconPng;

  static String get editProfile => 'edit_profile'.iconPng;

  static String get mapOutline => 'map_icon'.iconPng;

  static String get filledAdd => 'filled_add'.iconPng;

  static String get camera => 'camera'.iconPng;

  static String get map => 'map'.iconPng;

  //Folder Location
  static const String imageFolderLocation = 'assets/images';

  //Logo
  static const String appLogo = 'assets/logos/company_logo.png';

  //Images

  static const String intro1 = '$imageFolderLocation/iv_intro_1.png';
  static const String intro2 = '$imageFolderLocation/iv_intro_2.png';
  static const String intro3 = '$imageFolderLocation/iv_intro_3.png';

  //Icons
  static String get homeCategory1 => 'home_category1'.svg;

  static String get homeCategory2 => 'home_category2'.svg;

  static String get homeCategory3 => 'home_category3'.svg;

  static String get homeCategory4 => 'home_category4'.svg;

  static String get homeCategory5 => 'home_category5'.svg;

  static String get homeCategory6 => 'home_category6'.svg;

  static String get specialistIcon1 => 'specialist_icon_1'.svg;

  static String get specialistIcon2 => 'specialist_icon_2'.svg;

  static String get specialistIcon4 => 'specialist_icon_4'.svg;

  static String get specialistIcon5 => 'specialist_icon_5'.svg;

  static String get specialistIcon6 => 'specialist_icon_6'.svg;

  static String get specialistIcon3 => 'specialist_icon_3'.svg;

  static String get serviceIcon1 => 'service_icon_1'.svg;

  static String get serviceIcon2 => 'service_icon_2'.svg;

  static String get alarm => 'alarm'.svg;

  static String get calendar => 'calendar'.svg;

  static String get homeActive => 'home_active'.svg;

  static String get homeInactive => 'home_inactive'.svg;

  static String get servicesInactive => 'services_inactive'.svg;

  static String get servicesActive => 'services_active'.svg;

  static String get specialistInactive => 'specialist_inactive'.svg;

  static String get specialistActive => 'specialist_active'.svg;

  static String get myProfileInactive => 'my_profile_inactive'.svg;

  static String get myProfileActive => 'my_profile_active'.svg;

  static String get eye => 'eye'.svg;

  static String get cameraSvg => 'camera'.svg;

  static String get stethoscope => 'stethoscope'.svg;

  static String get arrowDown => 'arrow_down'.svg;
}

extension on String {
  ///for icon folder
  String get iconPng => 'assets/icons/$this.png';

  ///for logo folder
  String get logoPng => 'assets/logos/$this.png';

  ///for jpeg
  String get jpeg => 'assets/images/$this.jpeg';

  ///for svg folder
  String get svg => 'assets/svgs/$this.svg';
}
