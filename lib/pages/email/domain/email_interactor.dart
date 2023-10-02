import 'package:ambassador/index.dart';

class EmailInteractor {
  final AmbassadorApi ambassadorApi;

  EmailInteractor({required this.ambassadorApi});

  Future<void> checkEmailValid(String email) async {
    await ambassadorApi.checkEmailValid(email);
  }
}
