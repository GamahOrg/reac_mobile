import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../app_prefs.dart';
import '../../constants.dart';
import '../../environment/config/build_config.dart';
import '../../function.dart';
import '../di.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String acceptLanguage = "Accept-Language";
const String charset = "charset";
const String charsetValue = "UTF-8";
const String authorization = "authorization";

@module
abstract class DioModule {
  @preResolve
  @factoryMethod
  Future<Dio> getDio(AppPreferences _preferences) async {
    Dio dio = Dio();

    dio.updateHeader();

    if (!kReleaseMode) {
      dio.interceptors.add(LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (object) {
            log(object.toString());
          }));
    }

    return dio;
  }


}

extension DioHeader on Dio {
  void updateHeader() {
    var preferences = getIt<AppPreferences>();
    dPrint("Header${preferences.userToken}");

    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization: "Bearer ${preferences.userToken}",
      // authorization: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1YjBiOTQwNC00MTNhLTQ0NWItYWFiNC1kYTZmNzg1YmUxMjAiLCJ1c2VyTmFtZSI6Imluc3BlY3RvciIsImVtYWlsIjoiaW5zcGVjdG9yQEZldHJpX0RCX1FDX1YxLmNvbSIsImZ1bGxOYW1lQXIiOiLZhdmB2KrYtDEiLCJmdWxsTmFtZUVuIjoiaW5zcGVjdG9yMSIsInJvbGVJZCI6IjJmYzNiY2I0LWUxODMtNDA1Yy05ZDI5LTBkYTZjYzBkOWUzNiIsInJvbGVOYW1lIjoiSW5zcGVjdG9yIiwibmF0aW9uYWxJRCI6IjEwNDY0MDM5MzIiLCJrZXkiOiJwYVJqTG9zUkxwT3FSSlFFTGlJTlBFKzZJSDl0ZEJ5RjR3d3JWdkVieTRnPSIsIlBlcm1pc3Npb24iOlsiTG9va3VwLlZpZXciLCJMb29rdXAuQ3JlYXRlIiwiTG9va3VwLkVkaXQiLCJMb29rdXAuRGVsZXRlIiwiVmlvbGF0aW9uLlZpZXciLCJWaW9sYXRpb24uQ3JlYXRlIiwiVmlvbGF0aW9uLkVkaXQiLCJOb3RpZmljYXRpb24uVmlldyJdLCJuYmYiOjE2OTQzNjAxNTgsImV4cCI6MTY5NDQ0NjU1OCwiaWF0IjoxNjk0MzYwMTU4LCJpc3MiOiJodHRwOi8vRml0cmkuY29tIiwiYXVkIjoiaHR0cDovL0ZpdHJpLmNvbSJ9.p5u0y3mfZy6iHnCQOt2DHkuBt5Noh2VPmbV_E458VHo",
      acceptLanguage: preferences.getLanguage(),
      charset: charsetValue,
    };

    options = BaseOptions(
        baseUrl: getIt<BuildConfig>().baseUrl,
        headers: headers,
        receiveTimeout: const Duration(milliseconds: Constants.apiTimeOut),
        sendTimeout:  const Duration(milliseconds: Constants.apiTimeOut));
  }


}
