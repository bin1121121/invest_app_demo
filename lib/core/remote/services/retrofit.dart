import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:invest_app_flutter_test/core/remote/services/resource_type.dart';
import 'package:invest_app_flutter_test/utils/app_const.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';

class Retrofit extends DioForNative {
  static const String keyAuth = "Authorization";
  static const String keyAccept = "Accept";
  static const String keyContentType = "Content-Type";

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

    if (baseUrl == AppConstants.baseUrl) {
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
    if (options.headers.containsKey(keyAuth)) {
      options.headers.remove(keyAuth);
    }
    options.headers[keyAccept] = "application/json";
    options.headers[keyContentType] = "application/json";
    String? accessToken = await AppShared().getAccessToken();
    if (accessToken == null) {
      handler.next(options);
      return;
    }
    options.headers[keyAuth] = "Bearer $accessToken";
    options.connectTimeout = const Duration(minutes: 1);
    options.receiveTimeout = const Duration(minutes: 1);
    handler.next(options); //continue
  }

  void _errorInterceptor(
      DioException error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == ResourceType.requestErrorToken) {
      String? refreshToken = await AppShared().getRefreshToken();
      String? newToken = await _refreshTokenFunction(refreshToken!);
      if (newToken != null) {
        error.requestOptions.headers["Authorization"] = "Bearer $newToken";
        return handler.resolve(await fetch(error.requestOptions));
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
