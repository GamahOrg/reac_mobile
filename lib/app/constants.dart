class Constants {
  // static const String baseUrl = "https://setup.i-maher.com/";
  static const String defaultHostIp = "104.144.74.30";
  static const String empty = "";
  static const int zero = 0;
  static const double zeroDouble = 0;
  static const int apiTimeOut = 100000;
  static const String defaultLanguage = "ar-EG";
  static const String arLanguage = "ar-EG";
  static const String enLanguage = "en";
  static const String downloadsPath = "/storage/emulated/0/Download/";
  static const String serverDateFormat = "yyyy-MM-dd'T'HH:mm:ssZ";
  static const String refreshScreen = "refreshScreen";
  static const String reservationEntity = "reservation";
  static const String requestEntity = "Request";
  static const String updateScreen = "updateScreen";
  static const String appNameClient = "Customer";
  static const String appNameEngineer = "Engineer";
  static const bool loginWithIAM = false;

  static const String post = "POST";
  static const String multi_part_header = 'multipart/form-data';

  //validation
  static const int identityLen = 10;
  static RegExp passwordRegex = RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9]).{8,}$');

  //local Store keys
  static const appPreferencesToken = "app_preferences_token";

}

