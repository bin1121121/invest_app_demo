// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:invest_app_flutter_test/core/remote/services/resource_type.dart';
import 'package:invest_app_flutter_test/utils/app_const.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';

class Retrofit extends DioForNative {
  static const String KEY_AUTH = "Authorization";
  static const String KEY_ACCEPT = "Accept";
  static const String KEY_CONTENT_TYPE = "Content-Type";

  Retrofit({
    String? baseUrl,
    BaseOptions? options,
  }) : super(options) {
    interceptors.add(
      InterceptorsWrapper(
        onRequest: _requestInterceptor,
        onError: _errorInterceptor,
      ),
    );

    if (baseUrl == AppConstants.BASE_URL) {
      final CacheOptions cacheOptions = CacheOptions(
        // store: AppCacheStore.cacheStore,
        store: MemCacheStore(),
        policy: CachePolicy.request,
        hitCacheOnErrorExcept: [401, 403],
        maxStale: const Duration(days: 30),
        priority: CachePriority.high,
      );

      interceptors.add(DioCacheInterceptor(options: cacheOptions));
    }
  }

  void _requestInterceptor(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers.containsKey(KEY_AUTH)) {
      options.headers.remove(KEY_AUTH);
    }
    options.headers[KEY_ACCEPT] = "application/json";
    options.headers[KEY_CONTENT_TYPE] = "application/json";
    String? accessToken = await AppShared().getAccessToken();
    if (accessToken == null) {
      handler.next(options);
      return;
    }
    options.headers[KEY_AUTH] = "Bearer $accessToken";
    options.connectTimeout = const Duration(minutes: 1);
    options.receiveTimeout = const Duration(minutes: 1);
    handler.next(options); //continue
  }

  void _errorInterceptor(
      DioException error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == ResourceType.REQUEST_ERROR_TOKEN) {
      String? refreshToken = await AppShared().getRefreshToken();
      String? newToken = await _refreshTokenFunction(refreshToken!);
      if (newToken != null) {
        error.requestOptions.headers["Authorization"] = "Bearer $newToken";
        return handler.resolve(await this.fetch(error.requestOptions));
      }
    }
    return handler.next(error); //continue
  }

  Future<String?> _refreshTokenFunction(String oldRefresherToken) async {
    final response = await post('https://dummyjson.com/auth/refresh', data: {
      "refreshToken": oldRefresherToken,
      "expiresInMins": 1,
    });
    if (response.statusCode == 201 || response.statusCode == 200) {
      AppShared().setAccessToken(response.data['token']);
      AppShared().setRefreshToken(response.data['refreshToken']);
      return response.data['token'];
    } else {
      return null;
    }
  }
}
