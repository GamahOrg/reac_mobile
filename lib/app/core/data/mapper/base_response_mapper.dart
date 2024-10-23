import 'package:injectable/injectable.dart';
import 'package:reac/app/constants.dart';
import 'package:reac/app/extensions.dart';

import '../../domain/model/base_model.dart';
import '../response/base_response.dart';
import 'mapper.dart';

@injectable
class BaseResponseMapper{
  BaseDM<M> mapFromEntity<M>(BaseResponse? entity, {EntityMapper? dataMapper}) {
    return BaseDM(
        message: entity?.message?.orEmpty() ?? Constants.empty,
        isDone: entity?.isDone.orFalse() ?? false,
        data: dataMapper == null
            ? entity?.data ?? entity?.message.orEmpty()
            : mapData(entity?.data, dataMapper));
  }

  List<BaseDM> mapFromEntityList(List<BaseResponse> entities) {
    return entities.map((entity) => mapFromEntity(entity)).toList();
  }

  dynamic mapData(dynamic data, EntityMapper dataMapper) {
    if (data is List) {
      return dataMapper.mapFromEntityList(data);
    } else {
      return dataMapper.mapFromEntity(data);
    }
  }
}
