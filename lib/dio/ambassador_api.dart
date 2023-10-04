import 'package:ambassador/index.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class AmbassadorApi {
  final ProfileInfo _profileInfo = GetIt.instance.get<ProfileInfo>();

  final _dio = Dio();
  final _baseUrl = 'https://api.diverzum.hu/api/';

  Future<bool> checkEmailValid(String email) async {
    Response response = await _dio.post(
      '${_baseUrl}auth/authHandler',
      data: {'email': email},
    );

    _profileInfo.email = email;

    return response.data['status'] == 'login' ? true : false;
  }

  Future<bool> tryLogin(String password) async {
    Response response = await _dio.post(
      '${_baseUrl}auth/login',
      data: {
        'email': _profileInfo.email,
        'password': password,
      },
    );

    _profileInfo.accessToken = response.data['access_token'];

    return response.data['status'] == 'login' ? true : false;
  }
}
