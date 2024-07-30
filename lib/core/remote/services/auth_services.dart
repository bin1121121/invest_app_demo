import 'package:invest_app_flutter_test/core/remote/request/login_request.dart';
import 'package:invest_app_flutter_test/core/remote/request/register_request.dart';
import 'package:invest_app_flutter_test/core/remote/response/authentication_response.dart';
import 'package:invest_app_flutter_test/utils/app_const.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'auth_services.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AuthServices {
  factory AuthServices(Dio dio, {String baseUrl}) = _AuthServices;

  @POST("/users/add")
  Future<AuthenticationResponse> registerUser(@Body() RegisterRequest request);

  @POST("/user/login")
  Future<AuthenticationResponse> login(@Body() LoginRequest request);

  @GET("/auth/me")
  Future<AuthenticationResponse> getCurrentAuthUser();
}
