import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:farmbot/constants/my_strings.dart';

class DioConfig {
  static const Duration _timeOut = Duration(seconds: 5);
  DioConfig._();

  static Dio getDio() {
    final cacheOptions = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.request,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 7),
      priority: CachePriority.normal,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );

    BaseOptions options = BaseOptions(
      baseUrl: MyStrings.baseUrl,
      connectTimeout: _timeOut,
      receiveTimeout: _timeOut,
      headers: {Headers.acceptHeader: Headers.jsonContentType},
    );
    final Dio dio = Dio(options)
      ..interceptors.addAll(
        [
          LogInterceptor(
            error: true,
            responseBody: true,
            request: true,
          ),
          DioCacheInterceptor(options: cacheOptions)
        ],
      );
    return dio;
  }
}
