// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i12;
import 'package:flutter/material.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../../app_cubit.dart' as _i13;
import '../../features/data/remote_data_source/auth_api_service.dart' as _i14;
import '../../features/data/remote_data_source/auth_remote_data_soruce.dart'
    as _i16;
import '../../features/data/remote_data_source/claim_api_service.dart' as _i15;
import '../../features/data/remote_data_source/claim_remote_data_source.dart'
    as _i19;
import '../../features/data/repository/auth_repo_impl.dart' as _i18;
import '../../features/data/repository/claim_repository_impl.dart' as _i21;
import '../../features/domain/repository/claim_repository.dart' as _i20;
import '../../features/domain/repository/repository.dart' as _i17;
import '../../features/domain/use_cases/auth/check_status_use_case.dart'
    as _i22;
import '../../features/domain/use_cases/auth/login_use_case.dart' as _i23;
import '../../features/domain/use_cases/auth/reset_password_usecase.dart'
    as _i24;
import '../../features/domain/use_cases/auth/verify_user_use_case.dart' as _i25;
import '../../features/domain/use_cases/claim/add_arbitration_request_use_case.dart'
    as _i28;
import '../../features/domain/use_cases/claim/add_arbitrations_use_case.dart'
    as _i27;
import '../../features/domain/use_cases/claim/agreement_action_use_case.dart'
    as _i29;
import '../../features/domain/use_cases/claim/agreement_use_case.dart' as _i30;
import '../../features/domain/use_cases/claim/get_agreement_list_use_case.dart'
    as _i33;
import '../../features/domain/use_cases/claim/get_arbitrations_use_case.dart'
    as _i34;
import '../../features/domain/use_cases/claim/get_arbitrators_count_List_use_case.dart'
    as _i35;
import '../../features/domain/use_cases/claim/get_arbitrators_nomination_List_use_case.dart'
    as _i36;
import '../../features/domain/use_cases/claim/get_claim_details_use_case.dart'
    as _i38;
import '../../features/domain/use_cases/claim/get_claim_event_use_case.dart'
    as _i39;
import '../../features/domain/use_cases/claim/get_claims_use_case.dart' as _i37;
import '../../features/domain/use_cases/claim/get_interpretation_list_use_case.dart'
    as _i40;
import '../../features/domain/use_cases/claim/get_litigation_request_for_report_explanation_ue_case.dart'
    as _i41;
import '../../features/domain/use_cases/claim/get_notification_use_case.dart'
    as _i42;
import '../../features/domain/use_cases/claim/get_number_of_arbitration_panel_use_case.dart'
    as _i44;
import '../../features/domain/use_cases/claim/get_number_of_arbitrations_use_case.dart'
    as _i43;
import '../../features/domain/use_cases/claim/get_reconciliation_list_use_case.dart'
    as _i45;
import '../../features/domain/use_cases/claim/get_reconciliation_use_case.dart'
    as _i46;
import '../../features/domain/use_cases/claim/getArbitrationSessionLitigationRequestForAllSession.dart'
    as _i31;
import '../../features/domain/use_cases/claim/getLitigationRequestForAllSessionUseCase.dart'
    as _i32;
import '../../features/domain/use_cases/claim/interpretation_ruling_use_case.dart'
    as _i47;
import '../../features/domain/use_cases/claim/number_of_arbitrations_request_use_case.dart'
    as _i48;
import '../../features/domain/use_cases/claim/post_reconciliation_use_case.dart'
    as _i49;
import '../../features/domain/use_cases/claim/sendLitigationFeesRequestPaidUseCase.dart'
    as _i50;
import '../../features/domain/use_cases/claim/upload_file_use_case.dart'
    as _i51;
import '../../features/domain/use_cases/verify_otp_usecase.dart' as _i26;
import '../../features/presentation/auth_screens/login/login_cubit.dart'
    as _i60;
import '../../features/presentation/auth_screens/reset_password/reset_password_cubit.dart'
    as _i53;
import '../../features/presentation/home/home_cubit.dart' as _i62;
import '../../features/presentation/manager/agreement_cubit.dart' as _i57;
import '../../features/presentation/manager/claim_details_cubit.dart' as _i55;
import '../../features/presentation/manager/get_interpretation_rule_cubit.dart'
    as _i56;
import '../../features/presentation/manager/get_number_of_arbitration_panel_cubit.dart'
    as _i64;
import '../../features/presentation/manager/getArbitrationSessionLitigationRequestForAllSessionCubut.dart'
    as _i54;
import '../../features/presentation/manager/GetLitigationRequestForAllSessionCubit.dart'
    as _i59;
import '../../features/presentation/manager/notification_cubit.dart' as _i52;
import '../../features/presentation/manager/reconciliation_cubit.dart' as _i63;
import '../../features/presentation/manager/selection_arbitrator_cubit.dart'
    as _i58;
import '../../features/presentation/manager/verify_otp_cubit.dart' as _i61;
import '../app_prefs.dart' as _i10;
import '../core/data/mapper/base_response_mapper.dart' as _i3;
import '../core/data/network/network_info.dart' as _i7;
import '../core/data/network/safe_api.dart' as _i11;
import '../environment/config/build_config.dart' as _i8;
import '../environment/config/build_config_clint.dart' as _i9;
import 'module/di_module.dart' as _i65;
import 'module/dio_module.dart' as _i66;

const String _client = 'client';

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dIModule = _$DIModule();
  final dioModule = _$DioModule();
  gh.factory<_i3.BaseResponseMapper>(() => _i3.BaseResponseMapper());
  await gh.factoryAsync<_i4.SharedPreferences>(
    () => dIModule.prefs,
    preResolve: true,
  );
  gh.factory<_i5.InternetConnectionChecker>(() => dIModule.connectionChecker);
  gh.factory<_i6.Key>(() => dIModule.getKey());
  gh.factory<_i7.NetworkInfo>(
      () => _i7.NetworkInfoImpl(gh<_i5.InternetConnectionChecker>()));
  gh.factory<_i8.BuildConfig>(
    () => _i9.BuildConfigClient(),
    registerFor: {_client},
  );
  gh.factory<_i10.AppPreferences>(
      () => _i10.AppPreferences(gh<_i4.SharedPreferences>()));
  gh.factory<_i11.SafeApi>(() => _i11.SafeApi(gh<_i7.NetworkInfo>()));
  await gh.factoryAsync<_i12.Dio>(
    () => dioModule.getDio(gh<_i10.AppPreferences>()),
    preResolve: true,
  );
  gh.factory<_i13.AppCubit>(() => _i13.AppCubit(gh<_i10.AppPreferences>()));
  gh.factory<_i14.AuthServiceClient>(() => dIModule.getService(gh<_i12.Dio>()));
  gh.factory<_i15.ClaimServiceClient>(
      () => dIModule.getServiceClaims(gh<_i12.Dio>()));
  gh.factory<_i16.AuthRemoteDataSource>(
      () => _i16.RemoteDataSourceImpl(gh<_i14.AuthServiceClient>()));
  gh.factory<_i17.AuthRepository>(() => _i18.AuthRepositoryImpl(
        gh<_i16.AuthRemoteDataSource>(),
        gh<_i10.AppPreferences>(),
        gh<_i11.SafeApi>(),
      ));
  gh.factory<_i19.ClaimRemoteDataSource>(
      () => _i19.ClaimRemoteDataSourceImpl(gh<_i15.ClaimServiceClient>()));
  gh.factory<_i20.ClaimRepository>(() => _i21.ClaimRepositoryImpl(
        gh<_i19.ClaimRemoteDataSource>(),
        gh<_i10.AppPreferences>(),
        gh<_i11.SafeApi>(),
      ));
  gh.factory<_i22.CheckStatusUseCase>(
      () => _i22.CheckStatusUseCase(gh<_i17.AuthRepository>()));
  gh.factory<_i23.LoginUseCase>(
      () => _i23.LoginUseCase(gh<_i17.AuthRepository>()));
  gh.factory<_i24.ResetPasswordUseCase>(
      () => _i24.ResetPasswordUseCase(gh<_i17.AuthRepository>()));
  gh.factory<_i25.VerifyUserUseCase>(
      () => _i25.VerifyUserUseCase(gh<_i17.AuthRepository>()));
  gh.factory<_i26.VerifyOtpUseCase>(
      () => _i26.VerifyOtpUseCase(gh<_i17.AuthRepository>()));
  gh.factory<_i27.AddArbitratorUseCase>(
      () => _i27.AddArbitratorUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i28.AddArbitrationRequestUseCase>(
      () => _i28.AddArbitrationRequestUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i29.AgreementActionUseCase>(
      () => _i29.AgreementActionUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i30.AgreementDetailsUseCase>(
      () => _i30.AgreementDetailsUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i31.GetArbitrationSessionLitigationRequestUseCase>(() =>
      _i31.GetArbitrationSessionLitigationRequestUseCase(
          gh<_i20.ClaimRepository>()));
  gh.factory<_i32.GetLitigationRequestUseCase>(
      () => _i32.GetLitigationRequestUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i33.AgreementListUseCase>(
      () => _i33.AgreementListUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i34.GetArbitratorUseCase>(
      () => _i34.GetArbitratorUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i35.GetArbitratorsCountListUseCase>(
      () => _i35.GetArbitratorsCountListUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i36.GetArbitratorsNominationListUseCase>(() =>
      _i36.GetArbitratorsNominationListUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i37.GetClaimsUseCase>(
      () => _i37.GetClaimsUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i38.GetClaimDetailsUseCase>(
      () => _i38.GetClaimDetailsUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i39.GetClaimEventsUseCase>(
      () => _i39.GetClaimEventsUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i40.GetInterpretationListUseCase>(
      () => _i40.GetInterpretationListUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i41.GetLitigationRequestForReportExplanationUseCase>(() =>
      _i41.GetLitigationRequestForReportExplanationUseCase(
          gh<_i20.ClaimRepository>()));
  gh.factory<_i42.GetNotificationUseCase>(
      () => _i42.GetNotificationUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i43.GetNumberOfArbitrationUseCase>(
      () => _i43.GetNumberOfArbitrationUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i44.GetNumberOfArbitrationPanelUseCase>(() =>
      _i44.GetNumberOfArbitrationPanelUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i45.GetReconciliationListUseCase>(
      () => _i45.GetReconciliationListUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i46.GetReconciliationUseCase>(
      () => _i46.GetReconciliationUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i47.GetInterpretationRuleUseCase>(
      () => _i47.GetInterpretationRuleUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i48.NumberOfArbitrationRequestUseCase>(
      () => _i48.NumberOfArbitrationRequestUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i49.PostReconciliationUseCase>(
      () => _i49.PostReconciliationUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i50.SendLitigationFeesRequestPaidUseCase>(() =>
      _i50.SendLitigationFeesRequestPaidUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i51.UploadFileUseCase>(
      () => _i51.UploadFileUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i52.NotificationCubit>(
      () => _i52.NotificationCubit(gh<_i42.GetNotificationUseCase>()));
  gh.factory<_i53.ResetPasswordCubit>(
      () => _i53.ResetPasswordCubit(gh<_i24.ResetPasswordUseCase>()));
  gh.factory<_i54.GetArbitrationSessionLitigationRequestForAllSessionCubit>(
      () => _i54.GetArbitrationSessionLitigationRequestForAllSessionCubit(
          gh<_i31.GetArbitrationSessionLitigationRequestUseCase>()));
  gh.factory<_i55.ClaimDetailsCubit>(() => _i55.ClaimDetailsCubit(
        gh<_i38.GetClaimDetailsUseCase>(),
        gh<_i39.GetClaimEventsUseCase>(),
      ));
  gh.factory<_i56.InterpretationRulingCubit>(
      () => _i56.InterpretationRulingCubit(
            gh<_i47.GetInterpretationRuleUseCase>(),
            gh<_i51.UploadFileUseCase>(),
            gh<_i28.AddArbitrationRequestUseCase>(),
            gh<_i41.GetLitigationRequestForReportExplanationUseCase>(),
            gh<_i40.GetInterpretationListUseCase>(),
          ));
  gh.factory<_i57.AgreementCubit>(() => _i57.AgreementCubit(
        gh<_i30.AgreementDetailsUseCase>(),
        gh<_i29.AgreementActionUseCase>(),
        gh<_i33.AgreementListUseCase>(),
      ));
  gh.factory<_i58.AppointmentMembersArbitrationPanelCubit>(
      () => _i58.AppointmentMembersArbitrationPanelCubit(
            gh<_i34.GetArbitratorUseCase>(),
            gh<_i27.AddArbitratorUseCase>(),
            gh<_i36.GetArbitratorsNominationListUseCase>(),
          ));
  gh.factory<_i59.GetLitigationRequestForAllSessionCubit>(() =>
      _i59.GetLitigationRequestForAllSessionCubit(
          gh<_i32.GetLitigationRequestUseCase>()));
  gh.factory<_i60.LoginCubit>(() => _i60.LoginCubit(
        gh<_i23.LoginUseCase>(),
        gh<_i25.VerifyUserUseCase>(),
        gh<_i22.CheckStatusUseCase>(),
      ));
  gh.factory<_i61.VerifyOtpCubit>(
      () => _i61.VerifyOtpCubit(gh<_i26.VerifyOtpUseCase>()));
  gh.factory<_i62.HomeCubit>(() => _i62.HomeCubit(
        gh<_i37.GetClaimsUseCase>(),
        gh<_i38.GetClaimDetailsUseCase>(),
      ));
  gh.factory<_i63.ReconcilitionCubit>(() => _i63.ReconcilitionCubit(
        gh<_i46.GetReconciliationUseCase>(),
        gh<_i49.PostReconciliationUseCase>(),
        gh<_i45.GetReconciliationListUseCase>(),
      ));
  gh.factory<_i64.NumberOfArbitrationPanelCubit>(
      () => _i64.NumberOfArbitrationPanelCubit(
            gh<_i50.SendLitigationFeesRequestPaidUseCase>(),
            gh<_i35.GetArbitratorsCountListUseCase>(),
            gh<_i44.GetNumberOfArbitrationPanelUseCase>(),
            gh<_i43.GetNumberOfArbitrationUseCase>(),
            gh<_i48.NumberOfArbitrationRequestUseCase>(),
          ));
  return getIt;
}

class _$DIModule extends _i65.DIModule {}

class _$DioModule extends _i66.DioModule {}
