abstract class AppImage {
  ///logos
  static String get companyLogo => 'company_logo'.logoPng;

  ///images
  static String get maleDoctor => 'male_doctor'.imagePng;

  static String get femaleDoctor1 => 'female_doctor1'.imagePng;

  static String get femaleDoctor2 => 'female_doctor2'.imagePng;

  ///icons
  static String get bloodletting => 'bloodletting'.iconPng;

  static String get flushots => 'flushots'.iconPng;

  static String get home => 'home'.iconPng;

  static String get homeVisit => 'home_visit'.iconPng;

  static String get medicalKit => 'medical_kit'.iconPng;

  static String get notification => 'notification'.iconPng;

  static String get phlebotomy => 'phlebotomy'.iconPng;

  static String get stethoscope => 'stethoscope'.iconPng;

  static String get stethoscopeWhite => 'stethoscope_white'.iconPng;

  static String get trtAdministration => 'trt_administration'.iconPng;

  static String get user => 'user'.iconPng;

  static String get vitaminBooster => 'vitamin_booster'.iconPng;

  static String get vitaminIv => 'vitamin_iv'.iconPng;

  static String get mentalHealth => 'mental_health'.iconPng;

  static String get doctor => 'doctor'.iconPng;

  static String get fitnessCoach => 'fitness_coach'.iconPng;

  static String get hrtTreatment => 'hrt_treatment'.iconPng;

  static String get trtTreatment => 'trt_treatment'.iconPng;

  static String get nutritionalist => 'nutritionalist'.iconPng;

  static String get map => 'map'.iconPng;

  static String get search => 'search'.iconPng;

  //Folder Location
  static const String imageFolderLocation = 'assets/images';

  //Logo
  static const String appLogo = 'assets/logos/company_logo.png';

  //Images

  static const String intro1 = '$imageFolderLocation/iv_intro_1.png';
  static const String intro2 = '$imageFolderLocation/iv_intro_2.png';
  static const String intro3 = '$imageFolderLocation/iv_intro_3.png';

//Icons
}

extension on String {
  ///for image folder
  String get imagePng => 'assets/images/$this.png';

  ///for icon folder
  String get iconPng => 'assets/icons/$this.png';

  ///for logo folder
  String get logoPng => 'assets/logos/$this.png';

  ///for svg folder
  String get svg => 'assets/svgs/$this.svg';
}
