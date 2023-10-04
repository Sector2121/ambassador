part of 'password_bloc.dart';

@immutable
abstract class PasswordEvent extends Equatable {}

class PasswordSentEvent extends PasswordEvent {
  final String password;

  PasswordSentEvent({
    required this.password,
  });

  @override
  List<Object?> get props => [password];
}
