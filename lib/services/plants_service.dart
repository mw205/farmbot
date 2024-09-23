import 'package:dio/dio.dart';
import 'package:farmbot/model/api_result.dart';
import 'package:farmbot/model/spots_data_model.dart';
import 'package:farmbot/services/api_call_handler.dart';
import 'package:farmbot/services/dio_config.dart';

import '../constants/my_strings.dart';
import '../controllers/settings_services.dart';

abstract class PlantsService {
  Future<ApiResult<List<SpotsDataModel>>> getSpotsData();
}

class PlantsServiceImp implements PlantsService {
  final Dio _dio = DioConfig.getDio();
  @override
  Future<ApiResult<List<SpotsDataModel>>> getSpotsData() {
    return ApiCallHandler.handleApiCall(
      apiCall: () {
        _dio.options.headers["Authorization"] =
            "Bearer ${SettingsServices.instance.accessToken}";
        return _dio.get(MyStrings.profile + MyStrings.spots);
      },
      parser: ({required data}) {
        List<dynamic> spotsDataJson = data["data"];
        return spotsDataJson.map(
          (spotDataMap) {
            return SpotsDataModel.fromJson(spotDataMap);
          },
        ).toList();
      },
    );
  }
}
