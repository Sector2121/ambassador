import 'package:ambassador/index.dart';

class EmailInteractor {
  final AmbassadorApi ambassadorApi;

  EmailInteractor({required this.ambassadorApi});

  Future<bool> checkEmailValid(String email) async {
    return await ambassadorApi.checkEmailValid(email);
  }
}
