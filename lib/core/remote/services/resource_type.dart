// ignore_for_file: constant_identifier_names

class ResourceType {
  static const int REQUEST_DISCONNECT = -1;
  static const int REQUEST_NULL_DATA = 0;
  static const int REQUEST_CONNECT_TIMEOUT = 1;
  static const int REQUEST_SEND_TIMEOUT = 2;
  static const int REQUEST_RECEIVE_TIMEOUT = 3;
  static const int REQUEST_CANCEL = 4;
  static const int REQUEST_RESPONSE = 5;

  static const int REQUEST_SUCCESS = 200;
  static const int REQUEST_ERROR_SERVER = 500;
  static const int REQUEST_ERROR_TOKEN = 401;
}
