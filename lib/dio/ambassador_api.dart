import 'package:ambassador/index.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class AmbassadorApi {
  final ProfileInfo _profileInfo = GetIt.instance.get<ProfileInfo>();

  final _dio = Dio();
  final _baseUrl = 'https://api.diverzum.hu/api/';

  Future<bool> checkEmailValid(String email) async {
    try {
      Response response = await _dio.post(
        '${_baseUrl}auth/authHandler',
        data: {'email': email},
      );

      _profileInfo.email = email;

      return response.data['status'] == 'login' ? true : false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> tryLogin(String password) async {
    try {
      Response response = await _dio.post(
        '${_baseUrl}auth/login',
        data: {
          'email': _profileInfo.email,
          'password': password,
        },
      );

      _profileInfo.accessToken = response.data['access_token'];

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<dynamic>> getScoreboard() async {
    final String asd = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLmRpdmVyenVtLmh1XC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjk2NDQ1NTkwLCJuYmYiOjE2OTY0NDU1OTAsImp0aSI6InZBN0NvUDNOcUdPZUtWYlAiLCJzdWIiOjE2OTM0MywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.0sshaYLW1MWHNX_4SSUFpREmov9IDQ9HJDjht3qtcRY';
    try {
      Response response = await _dio.get(
        '${_baseUrl}auth/ambassador',
        //options: Options(headers: {'Authorization': 'Bearer ${_profileInfo.accessToken}'}),
        options: Options(headers: {'Authorization': 'Bearer ${asd}'}),
      );

      return response.data['leaderboard'] as List<dynamic>;
    } catch (e) {
      return [];
    }
  }
}
