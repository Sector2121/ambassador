import 'package:ambassador/index.dart';

class PasswordInteractor {
  final AmbassadorApi ambassadorApi;

  PasswordInteractor({required this.ambassadorApi});

  Future<bool> checkEmailValid(String email) async {
    return await ambassadorApi.checkEmailValid(email);
  }
}
