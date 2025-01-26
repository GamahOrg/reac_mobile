// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../app_cubit.dart' as _i813;
import '../../features/data/remote_data_source/auth_api_service.dart' as _i1069;
import '../../features/data/remote_data_source/auth_remote_data_soruce.dart'
    as _i1072;
import '../../features/data/remote_data_source/claim_api_service.dart' as _i470;
import '../../features/data/remote_data_source/claim_remote_data_source.dart'
    as _i762;
import '../../features/data/repository/auth_repo_impl.dart' as _i910;
import '../../features/data/repository/claim_repository_impl.dart' as _i202;
import '../../features/domain/repository/claim_repository.dart' as _i695;
import '../../features/domain/repository/repository.dart' as _i14;
import '../../features/domain/use_cases/auth/login_use_case.dart' as _i493;
import '../../features/domain/use_cases/auth/reset_password_usecase.dart'
    as _i224;
import '../../features/domain/use_cases/auth/verify_user_use_case.dart' as _i11;
import '../../features/domain/use_cases/claim/add_arbitration_request_use_case.dart'
    as _i18;
import '../../features/domain/use_cases/claim/add_arbitrations_use_case.dart'
    as _i991;
import '../../features/domain/use_cases/claim/agreement_action_use_case.dart'
    as _i935;
import '../../features/domain/use_cases/claim/agreement_use_case.dart' as _i639;
import '../../features/domain/use_cases/claim/get_agreement_list_use_case.dart'
    as _i556;
import '../../features/domain/use_cases/claim/get_arbitrations_use_case.dart'
    as _i249;
import '../../features/domain/use_cases/claim/get_arbitrators_count_List_use_case.dart'
    as _i218;
import '../../features/domain/use_cases/claim/get_arbitrators_nomination_List_use_case.dart'
    as _i305;
import '../../features/domain/use_cases/claim/get_claim_details_use_case.dart'
    as _i284;
import '../../features/domain/use_cases/claim/get_claim_event_use_case.dart'
    as _i961;
import '../../features/domain/use_cases/claim/get_claims_use_case.dart'
    as _i609;
import '../../features/domain/use_cases/claim/get_interpretation_list_use_case.dart'
    as _i812;
import '../../features/domain/use_cases/claim/get_litigation_request_for_report_explanation_ue_case.dart'
    as _i47;
import '../../features/domain/use_cases/claim/get_notification_use_case.dart'
    as _i162;
import '../../features/domain/use_cases/claim/get_number_of_arbitration_panel_use_case.dart'
    as _i157;
import '../../features/domain/use_cases/claim/get_number_of_arbitrations_use_case.dart'
    as _i621;
import '../../features/domain/use_cases/claim/get_reconciliation_list_use_case.dart'
    as _i672;
import '../../features/domain/use_cases/claim/get_reconciliation_use_case.dart'
    as _i807;
import '../../features/domain/use_cases/claim/interpretation_ruling_use_case.dart'
    as _i166;
import '../../features/domain/use_cases/claim/number_of_arbitrations_request_use_case.dart'
    as _i206;
import '../../features/domain/use_cases/claim/post_reconciliation_use_case.dart'
    as _i263;
import '../../features/domain/use_cases/claim/upload_file_use_case.dart'
    as _i924;
import '../../features/domain/use_cases/verify_otp_usecase.dart' as _i500;
import '../../features/presentation/auth_screens/login/login_cubit.dart'
    as _i869;
import '../../features/presentation/auth_screens/reset_password/reset_password_cubit.dart'
    as _i1040;
import '../../features/presentation/home/home_cubit.dart' as _i612;
import '../../features/presentation/manager/agreement_cubit.dart' as _i635;
import '../../features/presentation/manager/claim_details_cubit.dart' as _i829;
import '../../features/presentation/manager/get_interpretation_rule_cubit.dart'
    as _i352;
import '../../features/presentation/manager/get_number_of_arbitration_panel_cubit.dart'
    as _i88;
import '../../features/presentation/manager/notification_cubit.dart' as _i1053;
import '../../features/presentation/manager/reconciliation_cubit.dart' as _i312;
import '../../features/presentation/manager/selection_arbitrator_cubit.dart'
    as _i534;
import '../../features/presentation/manager/verify_otp_cubit.dart' as _i1024;
import '../app_prefs.dart' as _i868;
import '../core/data/mapper/base_response_mapper.dart' as _i885;
import '../core/data/network/network_info.dart' as _i627;
import '../core/data/network/safe_api.dart' as _i31;
import '../environment/config/build_config.dart' as _i278;
import '../environment/config/build_config_clint.dart' as _i1007;
import 'module/di_module.dart' as _i495;
import 'module/dio_module.dart' as _i556;

const String _client = 'client';

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dIModule = _$DIModule();
  final dioModule = _$DioModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => dIModule.prefs,
    preResolve: true,
  );
  gh.factory<_i973.InternetConnectionChecker>(() => dIModule.connectionChecker);
  gh.factory<_i409.Key>(() => dIModule.getKey());
  gh.factory<_i885.BaseResponseMapper>(() => _i885.BaseResponseMapper());
  gh.factory<_i627.NetworkInfo>(
      () => _i627.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()));
  gh.factory<_i278.BuildConfig>(
    () => _i1007.BuildConfigClient(),
    registerFor: {_client},
  );
  gh.factory<_i868.AppPreferences>(
      () => _i868.AppPreferences(gh<_i460.SharedPreferences>()));
  gh.factory<_i31.SafeApi>(() => _i31.SafeApi(gh<_i627.NetworkInfo>()));
  await gh.factoryAsync<_i361.Dio>(
    () => dioModule.getDio(gh<_i868.AppPreferences>()),
    preResolve: true,
  );
  gh.factory<_i813.AppCubit>(() => _i813.AppCubit(gh<_i868.AppPreferences>()));
  gh.factory<_i1069.AuthServiceClient>(
      () => dIModule.getService(gh<_i361.Dio>()));
  gh.factory<_i470.ClaimServiceClient>(
      () => dIModule.getServiceClaims(gh<_i361.Dio>()));
  gh.factory<_i1072.AuthRemoteDataSource>(
      () => _i1072.RemoteDataSourceImpl(gh<_i1069.AuthServiceClient>()));
  gh.factory<_i14.AuthRepository>(() => _i910.AuthRepositoryImpl(
        gh<_i1072.AuthRemoteDataSource>(),
        gh<_i868.AppPreferences>(),
        gh<_i31.SafeApi>(),
      ));
  gh.factory<_i762.ClaimRemoteDataSource>(
      () => _i762.ClaimRemoteDataSourceImpl(gh<_i470.ClaimServiceClient>()));
  gh.factory<_i695.ClaimRepository>(() => _i202.ClaimRepositoryImpl(
        gh<_i762.ClaimRemoteDataSource>(),
        gh<_i868.AppPreferences>(),
        gh<_i31.SafeApi>(),
      ));
  gh.factory<_i224.ResetPasswordUseCase>(
      () => _i224.ResetPasswordUseCase(gh<_i14.AuthRepository>()));
  gh.factory<_i493.LoginUseCase>(
      () => _i493.LoginUseCase(gh<_i14.AuthRepository>()));
  gh.factory<_i11.VerifyUserUseCase>(
      () => _i11.VerifyUserUseCase(gh<_i14.AuthRepository>()));
  gh.factory<_i500.VerifyOtpUseCase>(
      () => _i500.VerifyOtpUseCase(gh<_i14.AuthRepository>()));
  gh.factory<_i812.GetInterpretationListUseCase>(
      () => _i812.GetInterpretationListUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i162.GetNotificationUseCase>(
      () => _i162.GetNotificationUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i263.PostReconciliationUseCase>(
      () => _i263.PostReconciliationUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i284.GetClaimDetailsUseCase>(
      () => _i284.GetClaimDetailsUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i206.NumberOfArbitrationRequestUseCase>(() =>
      _i206.NumberOfArbitrationRequestUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i621.GetNumberOfArbitrationUseCase>(
      () => _i621.GetNumberOfArbitrationUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i218.GetArbitratorsCountListUseCase>(
      () => _i218.GetArbitratorsCountListUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i556.AgreementListUseCase>(
      () => _i556.AgreementListUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i807.GetReconciliationUseCase>(
      () => _i807.GetReconciliationUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i961.GetClaimEventsUseCase>(
      () => _i961.GetClaimEventsUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i991.AddArbitratorUseCase>(
      () => _i991.AddArbitratorUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i157.GetNumberOfArbitrationPanelUseCase>(() =>
      _i157.GetNumberOfArbitrationPanelUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i935.AgreementActionUseCase>(
      () => _i935.AgreementActionUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i639.AgreementDetailsUseCase>(
      () => _i639.AgreementDetailsUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i249.GetArbitratorUseCase>(
      () => _i249.GetArbitratorUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i166.GetInterpretationRuleUseCase>(
      () => _i166.GetInterpretationRuleUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i305.GetArbitratorsNominationListUseCase>(() =>
      _i305.GetArbitratorsNominationListUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i609.GetClaimsUseCase>(
      () => _i609.GetClaimsUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i18.AddArbitrationRequestUseCase>(
      () => _i18.AddArbitrationRequestUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i47.GetLitigationRequestForReportExplanationUseCase>(() =>
      _i47.GetLitigationRequestForReportExplanationUseCase(
          gh<_i695.ClaimRepository>()));
  gh.factory<_i672.GetReconciliationListUseCase>(
      () => _i672.GetReconciliationListUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i924.UploadFileUseCase>(
      () => _i924.UploadFileUseCase(gh<_i695.ClaimRepository>()));
  gh.factory<_i1053.NotificationCubit>(
      () => _i1053.NotificationCubit(gh<_i162.GetNotificationUseCase>()));
  gh.factory<_i1040.ResetPasswordCubit>(
      () => _i1040.ResetPasswordCubit(gh<_i224.ResetPasswordUseCase>()));
  gh.factory<_i829.ClaimDetailsCubit>(() => _i829.ClaimDetailsCubit(
        gh<_i284.GetClaimDetailsUseCase>(),
        gh<_i961.GetClaimEventsUseCase>(),
      ));
  gh.factory<_i869.LoginCubit>(() => _i869.LoginCubit(
        gh<_i493.LoginUseCase>(),
        gh<_i11.VerifyUserUseCase>(),
      ));
  gh.factory<_i352.InterpretationRulingCubit>(
      () => _i352.InterpretationRulingCubit(
            gh<_i166.GetInterpretationRuleUseCase>(),
            gh<_i924.UploadFileUseCase>(),
            gh<_i18.AddArbitrationRequestUseCase>(),
            gh<_i47.GetLitigationRequestForReportExplanationUseCase>(),
            gh<_i812.GetInterpretationListUseCase>(),
          ));
  gh.factory<_i88.NumberOfArbitrationPanelCubit>(
      () => _i88.NumberOfArbitrationPanelCubit(
            gh<_i218.GetArbitratorsCountListUseCase>(),
            gh<_i157.GetNumberOfArbitrationPanelUseCase>(),
            gh<_i621.GetNumberOfArbitrationUseCase>(),
            gh<_i206.NumberOfArbitrationRequestUseCase>(),
          ));
  gh.factory<_i635.AgreementCubit>(() => _i635.AgreementCubit(
        gh<_i639.AgreementDetailsUseCase>(),
        gh<_i935.AgreementActionUseCase>(),
        gh<_i556.AgreementListUseCase>(),
      ));
  gh.factory<_i534.AppointmentMembersArbitrationPanelCubit>(
      () => _i534.AppointmentMembersArbitrationPanelCubit(
            gh<_i249.GetArbitratorUseCase>(),
            gh<_i991.AddArbitratorUseCase>(),
            gh<_i305.GetArbitratorsNominationListUseCase>(),
          ));
  gh.factory<_i1024.VerifyOtpCubit>(
      () => _i1024.VerifyOtpCubit(gh<_i500.VerifyOtpUseCase>()));
  gh.factory<_i612.HomeCubit>(() => _i612.HomeCubit(
        gh<_i609.GetClaimsUseCase>(),
        gh<_i284.GetClaimDetailsUseCase>(),
      ));
  gh.factory<_i312.ReconcilitionCubit>(() => _i312.ReconcilitionCubit(
        gh<_i807.GetReconciliationUseCase>(),
        gh<_i263.PostReconciliationUseCase>(),
        gh<_i672.GetReconciliationListUseCase>(),
      ));
  return getIt;
}

class _$DIModule extends _i495.DIModule {}

class _$DioModule extends _i556.DioModule {}
