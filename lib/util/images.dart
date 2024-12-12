class Images {
  ///logos
  static String get companyLogo => 'company_logo'.logoPng;

  ///images
  static String get maleDoctor => 'male_doctor'.imagePng;
  static String get femaleDoctor => 'female_doctor'.imagePng;

  ///icons
  static String get bloodletting => 'bloodletting'.iconPng;
  static String get flushots => 'flushots'.iconPng;
  static String get home => 'home'.iconPng;
  static String get homeVisit => 'home_visit'.iconPng;
  static String get medicalKit=>'medical_kit'.iconPng;
  static String get notification=>'notification'.iconPng;
  static String get phlebotomy=>'phlebotomy'.iconPng;
  static String get stethoscope=>'Stethoscope'.iconPng;
  static String get trtAdministration=>'trtadministration'.iconPng;
  static String get user=>'user'.iconPng;
  static String get vitaminBooster=>'vitamin_booster'.iconPng;
  static String get vitaminIv=>'vitamin_iv'.iconPng;




}

extension on String {
  String get imagePng => 'assets/images/$this.png';

  String get iconPng => 'assets/icons/$this.png';

  String get logoPng => 'assets/logos/$this.png';

  String get jpg => 'assets/images/$this.jpg';
}
