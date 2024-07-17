import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class ErrorHandler implements Exception {
  String _errorMessage = "";
  ErrorHandler(this._errorMessage);
  ErrorHandler.dioException({required DioException error}) {
    _handleDioException(error);
  }

  ErrorHandler.otherException() {
    _handleOtherException();
  }
  getErrorMessage() {
    return _errorMessage;
  }

  _handleOtherException() {
    _errorMessage = "Something went Wrong";
    ErrorHandler serverError = ErrorHandler(_errorMessage);
    return serverError;
  }

  _handleDioException(DioException error) {
    ErrorHandler serverError;
    switch (error.type) {
      case DioExceptionType.cancel:
        _errorMessage = "Request to API server was cancelled";
        serverError = ErrorHandler(_errorMessage);
        break;
      case DioExceptionType.connectionTimeout:
        _errorMessage = "Connection time out";
        serverError = ErrorHandler(_errorMessage);
        break;
      case DioExceptionType.receiveTimeout:
        _errorMessage = "Receive time out";
        serverError = ErrorHandler(_errorMessage);
        break;
      case DioExceptionType.badResponse:
        if (error.response?.statusCode == 503) {
          _errorMessage = "Something went wrong";
          serverError = ErrorHandler(_errorMessage);
        } else if (error.response?.statusCode == 401) {
          _errorMessage = "Unauthorized";
          serverError = ErrorHandler(_errorMessage);
        } else {
          _errorMessage = "Bad Request";
          serverError = ErrorHandler(_errorMessage);
        }
        break;
      case DioExceptionType.unknown:
        Logger().log(Level.all, "Called here unknown");
        _errorMessage = "Something went wrong";
        serverError = ErrorHandler(_errorMessage);
        break;
      case DioExceptionType.sendTimeout:
        if (kReleaseMode) {
          _errorMessage = "Something went wrong";
        } else {
          _errorMessage = "Received timeout";
        }
        serverError = ErrorHandler(_errorMessage);
        break;
      case DioExceptionType.connectionError:
        _errorMessage = "No Internet connection";
        serverError = ErrorHandler(_errorMessage);
        break;
      default:
        _errorMessage = error.response?.statusMessage ?? "Something went wrong";
        serverError = ErrorHandler(_errorMessage);
        break;
    }
    return serverError;
  }
}
