import 'package:dio/dio.dart';
import 'package:farmbot/constants/my_strings.dart';
import 'package:farmbot/model/api_result.dart';
import 'package:farmbot/model/user_model.dart';
import 'package:farmbot/services/api_call_handler.dart';
import 'package:farmbot/services/dio_config.dart';

class RegisterService {
  RegisterService._();
  static final Dio _dio = DioConfig.getDio();
  static Future<ApiResult<UserModel>> registerUserByEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String passwordConfirmation,
    required String phoneCode,
  }) {
    return ApiCallHandler.handleApiCall(
      apiCall: () {
        return _dio.post(
          MyStrings.register,
          data: {
            "name": name,
            "phone": phoneNumber,
            "email": email,
            "password": password,
            "password_confirmation": passwordConfirmation,
            "phone_code": phoneCode,
          },
        );
      },
      parser: ({required data}) {
        return UserModel.fromJson(data);
      },
    );
  }
}
