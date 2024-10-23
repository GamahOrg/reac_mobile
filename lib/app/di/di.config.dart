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
import '../../features/domain/use_cases/auth/login_use_case.dart' as _i22;
import '../../features/domain/use_cases/auth/reset_password_usecase.dart'
    as _i23;
import '../../features/domain/use_cases/claim/add_arbitration_request_use_case.dart'
    as _i26;
import '../../features/domain/use_cases/claim/add_arbitrations_use_case.dart'
    as _i25;
import '../../features/domain/use_cases/claim/agreement_action_use_case.dart'
    as _i27;
import '../../features/domain/use_cases/claim/agreement_use_case.dart' as _i28;
import '../../features/domain/use_cases/claim/get_agreement_list_use_case.dart'
    as _i29;
import '../../features/domain/use_cases/claim/get_arbitrations_use_case.dart'
    as _i30;
import '../../features/domain/use_cases/claim/get_arbitrators_count_List_use_case.dart'
    as _i31;
import '../../features/domain/use_cases/claim/get_arbitrators_nomination_List_use_case.dart'
    as _i32;
import '../../features/domain/use_cases/claim/get_claim_details_use_case.dart'
    as _i34;
import '../../features/domain/use_cases/claim/get_claim_event_use_case.dart'
    as _i35;
import '../../features/domain/use_cases/claim/get_claims_use_case.dart' as _i33;
import '../../features/domain/use_cases/claim/get_interpretation_list_use_case.dart'
    as _i36;
import '../../features/domain/use_cases/claim/get_litigation_request_for_report_explanation_ue_case.dart'
    as _i37;
import '../../features/domain/use_cases/claim/get_notification_use_case.dart'
    as _i38;
import '../../features/domain/use_cases/claim/get_number_of_arbitration_panel_use_case.dart'
    as _i40;
import '../../features/domain/use_cases/claim/get_number_of_arbitrations_use_case.dart'
    as _i39;
import '../../features/domain/use_cases/claim/get_reconciliation_list_use_case.dart'
    as _i41;
import '../../features/domain/use_cases/claim/get_reconciliation_use_case.dart'
    as _i42;
import '../../features/domain/use_cases/claim/interpretation_ruling_use_case.dart'
    as _i43;
import '../../features/domain/use_cases/claim/number_of_arbitrations_request_use_case.dart'
    as _i44;
import '../../features/domain/use_cases/claim/post_reconciliation_use_case.dart'
    as _i45;
import '../../features/domain/use_cases/claim/upload_file_use_case.dart'
    as _i46;
import '../../features/domain/use_cases/verify_otp_usecase.dart' as _i24;
import '../../features/presentation/auth_screens/login/login_cubit.dart'
    as _i48;
import '../../features/presentation/auth_screens/reset_password/reset_password_cubit.dart'
    as _i49;
import '../../features/presentation/home/home_cubit.dart' as _i56;
import '../../features/presentation/manager/agreement_cubit.dart' as _i53;
import '../../features/presentation/manager/claim_details_cubit.dart' as _i50;
import '../../features/presentation/manager/get_interpretation_rule_cubit.dart'
    as _i51;
import '../../features/presentation/manager/get_number_of_arbitration_panel_cubit.dart'
    as _i52;
import '../../features/presentation/manager/notification_cubit.dart' as _i47;
import '../../features/presentation/manager/reconciliation_cubit.dart' as _i57;
import '../../features/presentation/manager/selection_arbitrator_cubit.dart'
    as _i54;
import '../../features/presentation/manager/verify_otp_cubit.dart' as _i55;
import '../app_prefs.dart' as _i10;
import '../core/data/mapper/base_response_mapper.dart' as _i3;
import '../core/data/network/network_info.dart' as _i7;
import '../core/data/network/safe_api.dart' as _i11;
import '../environment/config/build_config.dart' as _i8;
import '../environment/config/build_config_clint.dart' as _i9;
import 'module/di_module.dart' as _i58;
import 'module/dio_module.dart' as _i59;

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
  gh.factory<_i22.LoginUseCase>(
      () => _i22.LoginUseCase(gh<_i17.AuthRepository>()));
  gh.factory<_i23.ResetPasswordUseCase>(
      () => _i23.ResetPasswordUseCase(gh<_i17.AuthRepository>()));
  gh.factory<_i24.VerifyOtpUseCase>(
      () => _i24.VerifyOtpUseCase(gh<_i17.AuthRepository>()));
  gh.factory<_i25.AddArbitratorUseCase>(
      () => _i25.AddArbitratorUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i26.AddArbitrationRequestUseCase>(
      () => _i26.AddArbitrationRequestUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i27.AgreementActionUseCase>(
      () => _i27.AgreementActionUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i28.AgreementDetailsUseCase>(
      () => _i28.AgreementDetailsUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i29.AgreementListUseCase>(
      () => _i29.AgreementListUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i30.GetArbitratorUseCase>(
      () => _i30.GetArbitratorUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i31.GetArbitratorsCountListUseCase>(
      () => _i31.GetArbitratorsCountListUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i32.GetArbitratorsNominationListUseCase>(() =>
      _i32.GetArbitratorsNominationListUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i33.GetClaimsUseCase>(
      () => _i33.GetClaimsUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i34.GetClaimDetailsUseCase>(
      () => _i34.GetClaimDetailsUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i35.GetClaimEventsUseCase>(
      () => _i35.GetClaimEventsUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i36.GetInterpretationListUseCase>(
      () => _i36.GetInterpretationListUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i37.GetLitigationRequestForReportExplanationUseCase>(() =>
      _i37.GetLitigationRequestForReportExplanationUseCase(
          gh<_i20.ClaimRepository>()));
  gh.factory<_i38.GetNotificationUseCase>(
      () => _i38.GetNotificationUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i39.GetNumberOfArbitrationUseCase>(
      () => _i39.GetNumberOfArbitrationUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i40.GetNumberOfArbitrationPanelUseCase>(() =>
      _i40.GetNumberOfArbitrationPanelUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i41.GetReconciliationListUseCase>(
      () => _i41.GetReconciliationListUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i42.GetReconciliationUseCase>(
      () => _i42.GetReconciliationUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i43.GetInterpretationRuleUseCase>(
      () => _i43.GetInterpretationRuleUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i44.NumberOfArbitrationRequestUseCase>(
      () => _i44.NumberOfArbitrationRequestUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i45.PostReconciliationUseCase>(
      () => _i45.PostReconciliationUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i46.UploadFileUseCase>(
      () => _i46.UploadFileUseCase(gh<_i20.ClaimRepository>()));
  gh.factory<_i47.NotificationCubit>(
      () => _i47.NotificationCubit(gh<_i38.GetNotificationUseCase>()));
  gh.factory<_i48.LoginCubit>(() => _i48.LoginCubit(gh<_i22.LoginUseCase>()));
  gh.factory<_i49.ResetPasswordCubit>(
      () => _i49.ResetPasswordCubit(gh<_i23.ResetPasswordUseCase>()));
  gh.factory<_i50.ClaimDetailsCubit>(() => _i50.ClaimDetailsCubit(
        gh<_i34.GetClaimDetailsUseCase>(),
        gh<_i35.GetClaimEventsUseCase>(),
      ));
  gh.factory<_i51.InterpretationRulingCubit>(
      () => _i51.InterpretationRulingCubit(
            gh<_i43.GetInterpretationRuleUseCase>(),
            gh<_i46.UploadFileUseCase>(),
            gh<_i26.AddArbitrationRequestUseCase>(),
            gh<_i37.GetLitigationRequestForReportExplanationUseCase>(),
            gh<_i36.GetInterpretationListUseCase>(),
          ));
  gh.factory<_i52.NumberOfArbitrationPanelCubit>(
      () => _i52.NumberOfArbitrationPanelCubit(
            gh<_i31.GetArbitratorsCountListUseCase>(),
            gh<_i40.GetNumberOfArbitrationPanelUseCase>(),
            gh<_i39.GetNumberOfArbitrationUseCase>(),
            gh<_i44.NumberOfArbitrationRequestUseCase>(),
          ));
  gh.factory<_i53.AgreementCubit>(() => _i53.AgreementCubit(
        gh<_i28.AgreementDetailsUseCase>(),
        gh<_i27.AgreementActionUseCase>(),
        gh<_i29.AgreementListUseCase>(),
      ));
  gh.factory<_i54.AppointmentMembersArbitrationPanelCubit>(
      () => _i54.AppointmentMembersArbitrationPanelCubit(
            gh<_i30.GetArbitratorUseCase>(),
            gh<_i25.AddArbitratorUseCase>(),
            gh<_i32.GetArbitratorsNominationListUseCase>(),
          ));
  gh.factory<_i55.VerifyOtpCubit>(
      () => _i55.VerifyOtpCubit(gh<_i24.VerifyOtpUseCase>()));
  gh.factory<_i56.HomeCubit>(() => _i56.HomeCubit(
        gh<_i33.GetClaimsUseCase>(),
        gh<_i34.GetClaimDetailsUseCase>(),
      ));
  gh.factory<_i57.ReconcilitionCubit>(() => _i57.ReconcilitionCubit(
        gh<_i42.GetReconciliationUseCase>(),
        gh<_i45.PostReconciliationUseCase>(),
        gh<_i41.GetReconciliationListUseCase>(),
      ));
  return getIt;
}

class _$DIModule extends _i58.DIModule {}

class _$DioModule extends _i59.DioModule {}
