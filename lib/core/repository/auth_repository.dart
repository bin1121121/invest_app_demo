import 'package:invest_app_flutter_test/core/models/user_profile.dart';
import 'package:invest_app_flutter_test/core/network_bound_resource.dart';
import 'package:invest_app_flutter_test/core/remote/request/login_request.dart';
import 'package:invest_app_flutter_test/core/remote/request/register_request.dart';
import 'package:invest_app_flutter_test/core/remote/response/authentication_response.dart';
import 'package:invest_app_flutter_test/core/remote/services/auth_services.dart';
import 'package:invest_app_flutter_test/core/resource.dart';

import 'package:invest_app_flutter_test/core/type/gender_type.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';

class AuthRepository {
  final AuthServices _authServices;
  AuthRepository(this._authServices);

  Future<Resource<AuthenticationResponse>> login(
      LoginRequest loginRequest) async {
    return await NetworkBoundResource<AuthenticationResponse,
        AuthenticationResponse>(
      createSerializedCall: () => _authServices.login(loginRequest),
      saveCallResult: (authResponse) async {
        UserProfile userProfile = UserProfile(
          name: "${authResponse.firstName} ${authResponse.lastName}",
          email: authResponse.email,
          avatar: authResponse.image,
          gender: GenderType.values.byName(authResponse.gender ?? ""),
        );
        await AppShared().setUserProfile(userProfile);
        await AppShared().setAccessToken(authResponse.token ?? "");
        await AppShared().setRefreshToken(authResponse.refreshToken ?? "");
      },
    ).getAsFuture();
  }

  Future<Resource<AuthenticationResponse>> registerUser(
      RegisterRequest registerRequest) async {
    return NetworkBoundResource<AuthenticationResponse, AuthenticationResponse>(
      createSerializedCall: () => _authServices.registerUser(registerRequest),
    ).getAsFuture();
  }

  Future<Resource<AuthenticationResponse>> getCurrentAuthUser() async {
    return NetworkBoundResource<AuthenticationResponse, AuthenticationResponse>(
      createSerializedCall: () => _authServices.getCurrentAuthUser(),
    ).getAsFuture();
  }
}
