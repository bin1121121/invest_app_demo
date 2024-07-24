import 'dart:io';

import 'package:dio/dio.dart';
import 'package:invest_app_flutter_test/core/remote/services/resource_type.dart';
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
        code = ResourceType.REQUEST_CONNECT_TIMEOUT;
        message = AppLanguages.CONNECT_TIMEOUT;
        break;
      case DioExceptionType.sendTimeout:
        code = ResourceType.REQUEST_SEND_TIMEOUT;
        message = AppLanguages.SEND_TIMEOUT;
        break;
      case DioExceptionType.receiveTimeout:
        code = ResourceType.REQUEST_RECEIVE_TIMEOUT;
        message = AppLanguages.RECEIVE_TIMEOUT;
        break;
      case DioExceptionType.badResponse:
        Response? response = error.response;
        code = response?.statusCode ?? ResourceType.REQUEST_RESPONSE;
        if (response != null && code != ResourceType.REQUEST_ERROR_TOKEN) {
          message = response.data is String
              ? response.data
              : response.data is Map<String, dynamic>
                  ? response.data["message"] ?? ''
                  : '';
        }
        break;
      case DioExceptionType.cancel:
        code = ResourceType.REQUEST_CANCEL;
        break;
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        code = ResourceType.REQUEST_ERROR_SERVER;
        message = error.message ?? "";
        final err = error.error;
        if (err is HandshakeException) {
          message = err.osError?.message ?? err.message;
        } else if (message.contains("Network is unreachable")) {
          message = AppLanguages.NO_INTERNET_CONNECTION;
        } else if (message.contains("Connection refused")) {
          message = AppLanguages.INTERNAL_SERVER_ERROR;
        }
        break;
    }

    return Resource(message: message, code: code);
  }

  factory Resource.withDisconnect() => Resource(
        message: AppLanguages.NO_INTERNET_CONNECTION,
        code: ResourceType.REQUEST_DISCONNECT,
      );

  factory Resource.withNoData() => Resource(
        message: AppLanguages.NULL_DATA,
        code: ResourceType.REQUEST_NULL_DATA,
      );

  factory Resource.withHasData(DataType data) => Resource(
        message: AppLanguages.SUCCESS,
        code: ResourceType.REQUEST_SUCCESS,
        data: data,
      );

  bool get isSuccess => code == ResourceType.REQUEST_SUCCESS;

  bool get isErrorToken => code == ResourceType.REQUEST_ERROR_TOKEN;

  bool get isError => code != ResourceType.REQUEST_SUCCESS;

  bool get isDisconnect =>
      code == ResourceType.REQUEST_DISCONNECT ||
      code == ResourceType.REQUEST_ERROR_SERVER;
}
