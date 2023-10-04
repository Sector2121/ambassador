import 'package:ambassador/index.dart';

class ScoreboardInteractor {
  final AmbassadorApi ambassadorApi;

  ScoreboardInteractor({required this.ambassadorApi});

  Future<bool> getScoreboard() async {
    return await ambassadorApi.getScoreboard();
  }
}