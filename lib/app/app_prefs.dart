
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';


@injectable
class AppPreferences {
  static const String isDarkMode = 'isDarkMode';
  static const String lang = 'lang';
  static const String os = 'operatingSystem';
  static const String deviceId = 'deviceId';
  static const String _firebaseToken = 'firebaseToken';
  final String _userToken = 'IdToken';
  final String _userEmail = 'userEmail';
  final String _userTokenSaveTime = 'userTokenSaveTime';
  final String _userName = 'userName';
  final String _userPassword = 'userPassword';
  final String _isUserTypeSelected = 'isUserTypeSelected';
  final String _onBoarding = 'onBoarding';
  final String _userData = 'userData';
  final String _serverSettings = 'serverSettings';
  final String _rememberMeLogin = 'rememberMeLogin';
  final String _isUserTypeEngineer = 'isUserTypeEngineer';


  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<bool> putData(String key, dynamic value) async {
    if (value is String) return await _sharedPreferences.setString(key, value);
    if (value is int) return await _sharedPreferences.setInt(key, value);
    if (value == null) return await remove(key);
    return await _sharedPreferences.setBool(key, value);
  }

  dynamic getData(String key, dynamic def) {
    var value = _sharedPreferences.get(key);
    return value ?? def;
  }

  Future<bool> remove(String key) async {
    return await _sharedPreferences.remove(key);
  }


  String getLanguage() {
    return getData(lang, Constants.defaultLanguage);
  }

  setLanguage(String language) {
    putData(lang, language);
  }

  bool get onBoarding=>
      getData(_onBoarding, false);

  set onBoarding(bool value) {
    putData(_onBoarding, value);
  }


  set isUserTypeEngineer(bool value) {
    putData(_isUserTypeEngineer, value);
  }



  set isUserTypeSelected(bool value) {
    putData(_isUserTypeSelected, value);
  }
  String get userEmail =>
    getData(_userEmail, "");
  set userEmail(String? value){
    putData(_userEmail, value);
  }
  String get userToken=>
      getData(Constants.appPreferencesToken, "");

  set userToken(String? value) {
    putData(_userTokenSaveTime, DateTime.now().millisecondsSinceEpoch);
    putData(_userToken, value);
  }

  DateTime get userTokenSaveTime {
    var mil = getData(_userTokenSaveTime, 0);
    return DateTime.fromMillisecondsSinceEpoch(mil);
  }

  bool get rememberMeLogin=>
      getData(_rememberMeLogin, false);

  set rememberMeLogin(bool value) {
    putData(_rememberMeLogin, value);
  }

  String get userName=>
      getData(_userName, "");

  set userName(String value) {
    putData(_userName, value);
  }


  String get userPassword=>
      getData(_userPassword, "");

  set userPassword(String value) {
    putData(_userPassword, value);
  }

  String get firebaseToken=>
      getData(_firebaseToken, "");

  set firebaseToken(String value) {
    putData(_firebaseToken, value);
  }

  // void removeUserData(){
  //   userPassword  = "";
  //   userData = null;
  // }

}
