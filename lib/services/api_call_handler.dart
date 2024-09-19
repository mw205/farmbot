import 'package:dio/dio.dart';
import 'package:farmbot/model/api_result.dart';
import 'package:farmbot/model/error_handler.dart';

class ApiCallHandler {
  ApiCallHandler._();
  static Future<ApiResult<T>> handleApiCall<T>(
      {required Future<Response> Function() apiCall,
      required T Function({required dynamic data}) parser}) async {
    try {
      Response response = await apiCall();
      if (response.statusCode! >= 200 || response.statusCode! <= 300) {
        return ApiResult.success(data: parser(data: response.data));
      } else {
        throw Exception();
      }
    } on DioException catch (e) {
      ErrorHandler handler = ErrorHandler(
        statusCode: e.response!.statusCode!,
        message: e.response!.statusMessage!,
        success: false,
      );
      return ApiResult.error(error: handler);
    }
  }
}
