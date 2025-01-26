// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _ClaimServiceClient implements ClaimServiceClient {
  _ClaimServiceClient(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  });

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<BaseResponse<ClaimResponse>> getClaimsApi(
    int? PageIndex,
    int? pageSize,
    String? searchKey,
    List<int>? statuses,
    List<int>? types,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'PageIndex': PageIndex,
      r'pageSize': pageSize,
      r'searchKey': searchKey,
      r'statuses': statuses,
      r'types': types,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<ClaimResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa/api/mobile/LitigationRequest/List',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<ClaimResponse> _value;
    try {
      _value = BaseResponse<ClaimResponse>.fromJson(
        _result.data!,
        (json) => ClaimResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<ClaimDetailsModel>> getClaimsDetailsApi(
      String? litigationId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'litigationId': litigationId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<ClaimDetailsModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa/api/mobile/LitigationRequest/GetLitigationById',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<ClaimDetailsModel> _value;
    try {
      _value = BaseResponse<ClaimDetailsModel>.fromJson(
        _result.data!,
        (json) => ClaimDetailsModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<List<ClaimEventModel>>> getClaimsEventApi(
      String? requestId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'requestId': requestId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<BaseResponse<List<ClaimEventModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://staging-reac-api.rega.gov.sa/api/mobile/LitigationRequest/GetLitigationRequestEvents',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<List<ClaimEventModel>> _value;
    try {
      _value = BaseResponse<List<ClaimEventModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<ClaimEventModel>(
                    (i) => ClaimEventModel.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<AgreementModel>> getAgreementApi(
      String? requestId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'requestId': requestId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<AgreementModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa/api/mobile/LitigationRequest/GetCitizenLitigationRequestForAgreementRequestReplyByRequestId',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<AgreementModel> _value;
    try {
      _value = BaseResponse<AgreementModel>.fromJson(
        _result.data!,
        (json) => AgreementModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<AgreementModel>> getAgreementActionApi(
      AgreementAction agreementAction) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(agreementAction.toJson());
    final _options = _setStreamType<BaseResponse<AgreementModel>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa/api/mobile/LitigationRequest/AddCitizenLitigationRequestForAgreementRequestReply',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<AgreementModel> _value;
    try {
      _value = BaseResponse<AgreementModel>.fromJson(
        _result.data!,
        (json) => AgreementModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<Reconciliation>> getReconciliationApi(
      String? requestId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'requestId': requestId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<Reconciliation>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa/api/Reconciliation/GetCitizenLitigationRequestForReportReplyByRequestId',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<Reconciliation> _value;
    try {
      _value = BaseResponse<Reconciliation>.fromJson(
        _result.data!,
        (json) => Reconciliation.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<Reconciliation>> postReconciliationApi(
    String? requestId,
    int? minutesOfMeetingApprovalStatus,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'requestId': requestId,
      r'minutesOfMeetingApprovalStatus': minutesOfMeetingApprovalStatus,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<Reconciliation>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa/api/Reconciliation/AddCitizenLitigationRequestForReportReply',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<Reconciliation> _value;
    try {
      _value = BaseResponse<Reconciliation>.fromJson(
        _result.data!,
        (json) => Reconciliation.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<DetailsResponseModel>> interpretationOfTheRulingApi(
      String? litigationRequestId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'litigationRequestId': litigationRequestId
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<DetailsResponseModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa/api/mobile/Arbitration/GetLitigationRequestForReportByRequestId',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<DetailsResponseModel> _value;
    try {
      _value = BaseResponse<DetailsResponseModel>.fromJson(
        _result.data!,
        (json) => DetailsResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<List<UploadFileResponse>>> uploadFileRequestApi(
      List<File> files) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.addAll(files.map((i) => MapEntry(
        'files',
        MultipartFile.fromFileSync(
          i.path,
          filename: i.path.split(Platform.pathSeparator).last,
        ))));
    final _options =
        _setStreamType<BaseResponse<List<UploadFileResponse>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'https://staging-reac-api.rega.gov.sa/api/mobile/SysFileManager/Upload',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<List<UploadFileResponse>> _value;
    try {
      _value = BaseResponse<List<UploadFileResponse>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<UploadFileResponse>((i) =>
                    UploadFileResponse.fromJson(i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<dynamic>> addArbitrationRequestApi(
      ArbitrationRequestModel arbitrationRequestModel) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = arbitrationRequestModel;
    final _options = _setStreamType<BaseResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa/api/mobile/Arbitration/AddArbitrationReportExplanationRequest',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<dynamic> _value;
    try {
      _value = BaseResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<DetailsResponseModel>>
      getLitigationRequestForReportExplanationRequestByRequestId(
          String? litigationRequestId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'litigationRequestId': litigationRequestId
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<DetailsResponseModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa/api/mobile/Arbitration/GetLitigationRequestForReportExplanationRequestByRequestId',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<DetailsResponseModel> _value;
    try {
      _value = BaseResponse<DetailsResponseModel>.fromJson(
        _result.data!,
        (json) => DetailsResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<ClaimResponse>> getArbitratorsCountListApi(
    int? pageSize,
    int? PageIndex,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageSize': pageSize,
      r'pageIndex': PageIndex,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<ClaimResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa/api/mobile/Arbitration/GetCitizenLitigationRequestForArbitratorsCountReply',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<ClaimResponse> _value;
    try {
      _value = BaseResponse<ClaimResponse>.fromJson(
        _result.data!,
        (json) => ClaimResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<DetailsResponseModel>> getNumberOfArbitrationPanelApi(
      String? requestId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'requestId': requestId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<DetailsResponseModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa/api/mobile/Arbitration/GetLitigationRequestForAddArbitratorsCountByRequestId',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<DetailsResponseModel> _value;
    try {
      _value = BaseResponse<DetailsResponseModel>.fromJson(
        _result.data!,
        (json) => DetailsResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<List<NumberOfArbitrationsModel>>>
      getNumberOfArbitrationApi() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<BaseResponse<List<NumberOfArbitrationsModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://staging-reac-api.rega.gov.sa/api/mobile/SysArbitratorCount/Get',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<List<NumberOfArbitrationsModel>> _value;
    try {
      _value = BaseResponse<List<NumberOfArbitrationsModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<NumberOfArbitrationsModel>((i) =>
                    NumberOfArbitrationsModel.fromJson(
                        i as Map<String, dynamic>))
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<DetailsResponseModel>> getNumberOfArbitrationRequestApi(
      NumberOfArbitractionsRequestModel
          numberOfArbitractionsRequestModel) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = numberOfArbitractionsRequestModel;
    final _options = _setStreamType<BaseResponse<DetailsResponseModel>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa/api/mobile/Arbitration/AddArbitratorsCount',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<DetailsResponseModel> _value;
    try {
      _value = BaseResponse<DetailsResponseModel>.fromJson(
        _result.data!,
        (json) => DetailsResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<ClaimResponse>> getArbitratorsNominationListApi(
    int? pageSize,
    int? PageIndex,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageSize': pageSize,
      r'pageIndex': PageIndex,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<ClaimResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa/api/mobile/Arbitration/GetCitizenLitigationRequestForArbitratorsNominationListReply',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<ClaimResponse> _value;
    try {
      _value = BaseResponse<ClaimResponse>.fromJson(
        _result.data!,
        (json) => ClaimResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<DetailsResponseModel>> getArbitratorListReplyApi(
      String? requestId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'litigationRequestId': requestId
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<DetailsResponseModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa/api/mobile/Arbitration/GetCitizenLitigationRequestForArbitratorsNominationListReplyByRequestId',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<DetailsResponseModel> _value;
    try {
      _value = BaseResponse<DetailsResponseModel>.fromJson(
        _result.data!,
        (json) => DetailsResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<DetailsResponseModel>> addNumberOfArbitrationRequestApi(
      SelectionArbitratorRequest selectionarbitratorRequest) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = selectionarbitratorRequest;
    final _options = _setStreamType<BaseResponse<DetailsResponseModel>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa/api/mobile/Arbitration/AddCitizenLitigationRequestForReportArbitratorsNominationListReply',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<DetailsResponseModel> _value;
    try {
      _value = BaseResponse<DetailsResponseModel>.fromJson(
        _result.data!,
        (json) => DetailsResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<ClaimResponse>> getReconciliationListApi(
    int? pageSize,
    int? PageIndex,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageSize': pageSize,
      r'pageIndex': PageIndex,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<ClaimResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa/api/Reconciliation/GetCitizenLitigationRequestForReportReply',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<ClaimResponse> _value;
    try {
      _value = BaseResponse<ClaimResponse>.fromJson(
        _result.data!,
        (json) => ClaimResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<ClaimResponse>> getInterpretationListApi(
    int? pageSize,
    int? PageIndex,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageSize': pageSize,
      r'pageIndex': PageIndex,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<ClaimResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa/api/mobile/Arbitration/GetLitigationRequestForReportExplanationRequest',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<ClaimResponse> _value;
    try {
      _value = BaseResponse<ClaimResponse>.fromJson(
        _result.data!,
        (json) => ClaimResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<ClaimResponse>> getAgreementListApi(
    int? pageSize,
    int? PageIndex,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageSize': pageSize,
      r'pageIndex': PageIndex,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<ClaimResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa/api/mobile/LitigationRequest/GetCitizenLitigationRequestForAgreementRequestReply',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<ClaimResponse> _value;
    try {
      _value = BaseResponse<ClaimResponse>.fromJson(
        _result.data!,
        (json) => ClaimResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<NotificationModel>> getNotificationListApi() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<NotificationModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'https://staging-reac-api.rega.gov.sa:3333/api/Notification/GetNotificationListForPortal',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<NotificationModel> _value;
    try {
      _value = BaseResponse<NotificationModel>.fromJson(
        _result.data!,
        (json) => NotificationModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
