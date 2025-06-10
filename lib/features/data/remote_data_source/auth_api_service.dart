import 'package:dio/dio.dart';
import 'package:reac/features/data/request/verify_request.dart';
import 'package:reac/features/domain/models/auth/check_status_response.dart';
import 'package:retrofit/http.dart';

import '../../../app/api_urls.dart';
import '../../../app/core/data/response/base_response.dart';
import '../../../app/core/domain/model/base_model.dart';
import '../../domain/models/auth/auth_response.dart';
import '../../domain/models/auth/login_response.dart';
import '../request/login_request.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthServiceClient {
  factory AuthServiceClient(Dio dio, {String baseUrl}) = _AuthServiceClient;


  @POST(ApiUrls.verifyUser)
  Future<BaseResponse<TransactionResponse>> verifyUser(
      {@Body() required VerifyRequest request});

  @POST(ApiUrls.resetPassword)
  Future<BaseDM<String>> resetPassword({
    @Query("identityNumber") String? identityNumber,
  });

  @POST(ApiUrls.verifyOtp)
  Future<BaseDM<String>> verifyOtp(
      {@Query("newMobileNumber") String? newMobileNumber,
        @Query("OTP") String? OTP});

  @POST(ApiUrls.login)
  Future<BaseResponse<LoginResponse>> login(
      {@Body() required LoginRequest loginRequest});
  @GET(ApiUrls.checkStatus)
  Future<BaseResponse<CheckStatusReponse>> checkStatus({
    @Query("transactionId") String? transactionId, // Optional parameter
  });


}
