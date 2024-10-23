import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../features/data/remote_data_source/auth_api_service.dart';
import '../../../features/data/remote_data_source/claim_api_service.dart';




@module
abstract class DIModule{
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  InternetConnectionChecker get connectionChecker => InternetConnectionChecker();


  AuthServiceClient getService(Dio client) => AuthServiceClient(client);
  ClaimServiceClient getServiceClaims(Dio client) => ClaimServiceClient(client);




  Key getKey() => UniqueKey();

}