import 'package:dio/dio.dart';
import 'package:farmbot/constants/my_strings.dart';
import 'package:farmbot/controllers/settings_services.dart';
import 'package:farmbot/model/api_result.dart';
import 'package:farmbot/model/user_model.dart';
import 'package:farmbot/services/api_call_handler.dart';
import 'package:farmbot/services/dio_config.dart';

abstract class ProfileService {
  Future<ApiResult<UserModel>> fetchProfileData();
  Future<ApiResult<UserModel>> updateProfileData();
}

class ProfileServiceImp extends ProfileService {
  final Dio _dio = DioConfig.getDio();
  ProfileServiceImp._();
  static final ProfileServiceImp instance = ProfileServiceImp._();
  @override
  Future<ApiResult<UserModel>> fetchProfileData() {
    return ApiCallHandler.handleApiCall(
      apiCall: () {
        _dio.options.headers["Authorization"] =
            "Bearer ${SettingsServices.instance.accessToken}";
        return _dio.get(
          MyStrings.profile,
        );
      },
      parser: ({required data}) => UserModel.fromJson(data),
    );
  }

  @override
  Future<ApiResult<UserModel>> updateProfileData() {
    return ApiCallHandler.handleApiCall(
      apiCall: () {
        _dio.options.headers["Authorization"] =
            "Bearer ${SettingsServices.instance.accessToken}";
        return _dio.put(
          MyStrings.profile,
        );
      },
      parser: ({required data}) => UserModel.fromJson(data),
    );
  }
}
