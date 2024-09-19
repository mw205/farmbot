import 'package:dio/dio.dart';
import 'package:farmbot/constants/my_strings.dart';
import 'package:farmbot/model/api_result.dart';
import 'package:farmbot/model/user_model.dart';
import 'package:farmbot/services/api_call_handler.dart';
import 'package:farmbot/services/dio_config.dart';

class LoginService {
  LoginService._();
  static final Dio _dio = DioConfig.getDio();
  static Future<ApiResult<UserModel>> loginUserWithEmailAndPassword(
      {required String email, required String password}) async {
    return ApiCallHandler.handleApiCall(
      apiCall: () {
        final response = _dio.post(
          MyStrings.login,
          data: {
            "username": email,
            "password": password,
          },
        );
        return response;
      },
      parser: ({required data}) {
        return UserModel.fromJson(data);
      },
    );
  }

  static Future<ApiResult<UserModel>> loginUserWithFirebase(
      {required String token}) async {
    return ApiCallHandler.handleApiCall(
      apiCall: () {
        final response = _dio.post(
          MyStrings.firebase + MyStrings.login,
          data: {"access_token": token},
        );
        return response;
      },
      parser: ({required data}) {
        return UserModel.fromJson(data);
      },
    );
  }
}
