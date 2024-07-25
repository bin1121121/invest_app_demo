import 'package:invest_app_flutter_test/core/remote/response/authentication_response.dart';
import 'package:invest_app_flutter_test/utils/app_const.dart';
import 'package:retrofit/http.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
part 'auth_services.g.dart';

@RestApi(baseUrl: AppConstants.BASE_URL)
abstract class AuthServices {
  factory AuthServices(Dio dio, {String baseUrl}) = _AuthServices;

  @POST("/users/add")
  Future<AuthenticationResponse> registerUser(
    @Field("firstName") String firstName,
    @Field("lastName") String lastName,
    @Field("gender") String gender,
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST("/user/login")
  Future<AuthenticationResponse> login(
    @Field("username") String email,
    @Field("password") String password,
    @Field("expiresInMins") int expiresInMins,
  );

  @GET("/auth/me")
  Future<AuthenticationResponse> getCurrentAuthUser();
}
