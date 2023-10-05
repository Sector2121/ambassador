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

  Future<BackendAnswer> tryLogin(String password) async {
    try {
      Response response = await _dio.post(
        '${_baseUrl}auth/login',
        data: {
          'email': _profileInfo.email,
          'password': password,
        },
      );

      _profileInfo.accessToken = response.data['access_token'];

      return BackendAnswer(null, statusOk: true);
    } on DioException catch (e) {
      final errorMessage = e.response?.data['errors']['password'][0];
      return BackendAnswer(errorMessage, statusOk: false);
    } catch (e) {
      return BackendAnswer(null, statusOk: false);
    }
  }

  Future<List<dynamic>> getScoreboard() async {
    try {
      Response response = await _dio.get(
        '${_baseUrl}auth/ambassador',
        options: Options(headers: {'Authorization': 'Bearer ${_profileInfo.accessToken}'}),
      );

      return response.data['leaderboard'] as List<dynamic>;
    } catch (e) {
      return [];
    }
  }
}
