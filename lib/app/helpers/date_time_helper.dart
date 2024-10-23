
import 'package:intl/date_symbol_data_local.dart';

import 'package:intl/intl.dart';

import '../../my_app.dart';
import '../app_prefs.dart';
import '../constants.dart';
import '../di/di.dart';

class DateTimeHelper {

  static getDayNameFromDate(DateTime date) {
    String lang = getIt<AppPreferences>().getLanguage();
    initializeDateFormatting("ar",null).then((_){});
    return DateFormat('EEEE', lang).format(date);
  }

  static getMonthNameFromDate(DateTime date) {
    String l = getIt<AppPreferences>().getLanguage();
    return DateFormat('MMMM', l).format(date);
  }

  static getDateWithMonthNameFromDate(DateTime date) {
    String l = getIt<AppPreferences>().getLanguage();
    return DateFormat('dd MMMM yyyy', l).format(date);
  }

  static getDayWithMonthNameFromDate(DateTime date) {
    String l = getIt<AppPreferences>().getLanguage();
    return DateFormat('dd-MMMM', l).format(date);
  }

  static getDateWithTimeFromDate(DateTime date) {
    String l = getIt<AppPreferences>().getLanguage();
    return DateFormat('hh:mm a dd-MM-yyyy', l).format(date);
  }

  static getDateWithTimeFromDate2(DateTime date) {
    String l = getIt<AppPreferences>().getLanguage();
    return DateFormat('hh:mm a dd MMMM', l).format(date);
  }


  static String getDateWithMonthNameAndDayNameFromDate(DateTime date) {
    String l = getIt<AppPreferences>().getLanguage();
    return DateFormat('EEEE, dd MMMM, yyyy', l).format(date);
  }
  static DateTime parse(String? date){
    return DateTime.parse(date??"");
  }
  static String formatStringToNewFormat(String? data){
    var date = parse(data);
    return formateDate(date);
  }
  static String formateDate(DateTime date) {
    // return DateFormat('yyyy-MM-dd').format(date);

    return DateFormat('d/M/yyyy').format(date);

  }
 static String formatExplanationRequestDate(String? date) {
    if (date == null || date.isEmpty) {
      return 'Invalid Date'; // Handle null or empty case
    }

    try {
      return DateTimeHelper.formatStringToNewFormat(date); // Attempt to format
    } catch (e) {
      return 'Invalid Date'; // Handle format exception
    }
  }


  static String getTimeFromDatetime(DateTime date) {
    //  String lang = getIt<AppPreferences>().getLanguage();
    // initializeDateFormatting("ar",null).then((_){});
    return DateFormat.Hm().format(date);
  }
  static String getTimeFromServerStringFormat(String date) {
    try{
      var d  = DateFormat(Constants.serverDateFormat).parse(date);
      return DateFormat.Hm().format(d);
    }catch(e){
      return "";
    }
  }
  static String getFromServerStringFormat(DateTime date) {
    try{
      return DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(date);
    }catch(e){
      return "";
    }
  }
  

  static timeSubstring(String time) {
    return time.substring(0, 5);
  }

  static getTimeType(String type) {
    String _type = type.toLowerCase();
    if (_type == "am") {
      return MyApp.tr.am;
    }
    return MyApp.tr.pm;
  }

   static getTimeTypeFromHour(int hour) {
    if (hour < 12) {
      return MyApp.tr.am;
    }
    return MyApp.tr.pm;
  }
}