import 'package:dio/dio.dart';

class AmbassadorApi {
  final _dio = Dio();
  final _baseUrl = 'https://api.diverzum.hu/api/';

  Future<void> checkEmailValid(String email) async {
    Response response = await _dio.post(
      '${_baseUrl}auth/authHandler',
      data: {'email': email},
    );

    print('letsgo');
  }
}
