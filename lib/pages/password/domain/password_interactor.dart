import 'package:ambassador/index.dart';

class PasswordInteractor {
  final AmbassadorApi ambassadorApi;

  PasswordInteractor({required this.ambassadorApi});

  Future<BackendAnswer> tryLogin(String password) async {
    return await ambassadorApi.tryLogin(password);
  }
}
