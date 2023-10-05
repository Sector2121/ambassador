import 'package:ambassador/index.dart';
import 'package:get_it/get_it.dart';

void registerServices() {
  final services = GetIt.instance;

  services.registerSingleton<ApplicationConfig>(ApplicationConfig());
  services.registerSingleton<ProfileInfo>(ProfileInfo());
  services.registerSingleton<AmbassadorApi>(AmbassadorApi());
}

void registerBlocs() {
  final services = GetIt.instance;

  services.registerSingleton<EmailInteractor>(
    EmailInteractor(
      ambassadorApi: services.get<AmbassadorApi>(),
    ),
  );

  services.registerFactory<EmailBloc>(
    () => EmailBloc(
      emailInteractor: services.get<EmailInteractor>(),
    ),
  );

  services.registerSingleton<LeaderboardInteractor>(
    LeaderboardInteractor(
      ambassadorApi: services.get<AmbassadorApi>(),
    ),
  );

  services.registerFactory<LeaderboardBloc>(
    () => LeaderboardBloc(
      leaderboardInteractor: services.get<LeaderboardInteractor>(),
    ),
  );

  services.registerSingleton<PasswordInteractor>(
    PasswordInteractor(
      ambassadorApi: services.get<AmbassadorApi>(),
    ),
  );

  services.registerFactory<PasswordBloc>(
    () => PasswordBloc(
      passwordInteractor: services.get<PasswordInteractor>(),
    ),
  );

  services.registerSingleton<ScoreboardInteractor>(
    ScoreboardInteractor(
      ambassadorApi: services.get<AmbassadorApi>(),
    ),
  );

  services.registerFactory<ScoreboardBloc>(
    () => ScoreboardBloc(
      scoreboardInteractor: services.get<LeaderboardInteractor>(),
    ),
  );
}
