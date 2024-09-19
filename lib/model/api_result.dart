import 'package:farmbot/model/error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  factory ApiResult.success({required T data}) = Success<T>;
  factory ApiResult.error({required ErrorHandler error}) = Error<T>;
}
