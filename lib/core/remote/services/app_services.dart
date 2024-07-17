import 'package:invest_app_flutter_test/core/remote/response/authentication_response.dart';
import 'package:invest_app_flutter_test/utils/app_const.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'app_services.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class AppServices {
  factory AppServices(Dio dio, {String baseUrl}) = _AppServices;

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
  );

  @GET("/users/1")
  Future<AuthenticationResponse> getUser();
}
