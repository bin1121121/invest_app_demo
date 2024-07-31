import 'dart:io';

import 'package:dio/dio.dart';
import 'package:invest_app_flutter_test/core/resource_type.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

class Resource<DataType> {
  int code;
  String message;
  DataType? data;

  Resource({this.code = 0, this.message = '', this.data});

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': data,
      };

  factory Resource.withError(DioException error, {DataType? data}) {
    String message = '';
    final int code;
    switch (error.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
        code = ResourceType.requestConnectTimeout;
        message = AppLanguages.connectTimeout;
        break;
      case DioExceptionType.sendTimeout:
        code = ResourceType.requestSendTimeout;
        message = AppLanguages.sendTimeout;
        break;
      case DioExceptionType.receiveTimeout:
        code = ResourceType.requestReceiveTimeout;
        message = AppLanguages.receiveTimeout;
        break;
      case DioExceptionType.badResponse:
        Response? response = error.response;
        code = response?.statusCode ?? ResourceType.requestResponse;
        if (response != null && code != ResourceType.requestErrorToken) {
          message = response.data is String
              ? response.data
              : response.data is Map<String, dynamic>
                  ? response.data["message"] ?? ''
                  : '';
        }
        break;
      case DioExceptionType.cancel:
        code = ResourceType.requestCancel;
        break;
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        code = ResourceType.requestErrorServer;
        message = error.message ?? "";
        final err = error.error;
        if (err is HandshakeException) {
          message = err.osError?.message ?? err.message;
        } else if (message.contains("Network is unreachable")) {
          message = AppLanguages.noInternetConnection;
        } else if (message.contains("Connection refused")) {
          message = AppLanguages.internalServerError;
        }
        break;
    }

    return Resource(message: message, code: code);
  }

  factory Resource.withDisconnect() => Resource(
        message: AppLanguages.noInternetConnection,
        code: ResourceType.requestDisconnect,
      );

  factory Resource.withNoData() => Resource(
        message: AppLanguages.nullData,
        code: ResourceType.requestNullData,
      );

  factory Resource.withHasData(DataType data) => Resource(
        message: AppLanguages.success,
        code: ResourceType.requestSuccess,
        data: data,
      );

  bool get isSuccess => code == ResourceType.requestSuccess;

  bool get isErrorToken => code == ResourceType.requestErrorToken;

  bool get isError => code != ResourceType.requestSuccess;

  bool get isDisconnect =>
      code == ResourceType.requestDisconnect ||
      code == ResourceType.requestErrorServer;
}
