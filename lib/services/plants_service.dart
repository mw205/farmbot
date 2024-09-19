import 'package:farmbot/model/api_result.dart';

abstract class PlantsService {
  Future<ApiResult<dynamic>> getMoistureData();
  Future<ApiResult<dynamic>> getCropMaturityData();
}

class PlantsServiceImp extends PlantsService {
  @override
  Future<ApiResult> getCropMaturityData() {
    // TODO: implement getCropMaturityData
    throw UnimplementedError();
  }

  @override
  Future<ApiResult> getMoistureData() {
    // TODO: implement getMoistureData
    throw UnimplementedError();
  }
}
