import 'package:invest_app_flutter_test/core/remote/request/auth_request.dart';
import 'package:invest_app_flutter_test/core/remote/response/authentication_response.dart';
import 'package:invest_app_flutter_test/core/remote/services/auth_services.dart';
import 'package:invest_app_flutter_test/core/remote/services/network_bound_resource.dart';
import 'package:invest_app_flutter_test/core/remote/services/resource.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';

class AuthRepository {
  final AuthServices _authServices;
  AuthRepository(
    this._authServices,
  );

  Future<Resource<AuthenticationResponse>> login(
      LoginRequest loginRequest) async {
    return await NetworkBoundResource<AuthenticationResponse,
        AuthenticationResponse>(
      createSerializedCall: () => _authServices.login(
        loginRequest.email,
        loginRequest.password,
        1,
      ),
      saveCallResult: (result) async {
        await AppShared().setUserName(
          "${result.firstName} ${result.lastName}",
        );
        await AppShared().setAccessToken(result.token ?? "");
        await AppShared().setAvatar(result.image ?? "");
        await AppShared().setGender(result.gender ?? "");
        await AppShared().setEmail(result.email ?? "");
        await AppShared().setAccessToken(result.token ?? "");
        await AppShared().setRefreshToken(result.refreshToken ?? "");
      },
    ).getAsFuture();
  }

  Future<Resource<AuthenticationResponse>> registerUser(
      RegisterRequest registerRequest) async {
    return NetworkBoundResource<AuthenticationResponse, AuthenticationResponse>(
      createSerializedCall: () => _authServices.registerUser(
        registerRequest.firstName,
        registerRequest.lastName,
        registerRequest.gender,
        registerRequest.email,
        registerRequest.password,
      ),
    ).getAsFuture();
  }

  Future<Resource<AuthenticationResponse>> getCurrentAuthUser() async {
    return NetworkBoundResource<AuthenticationResponse, AuthenticationResponse>(
      createSerializedCall: () => _authServices.getCurrentAuthUser(),
    ).getAsFuture();
  }
}
