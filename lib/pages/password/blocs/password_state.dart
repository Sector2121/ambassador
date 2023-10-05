part of 'password_bloc.dart';

@immutable
abstract class PasswordState extends Equatable {}

class PasswordInitialState extends PasswordState {
  @override
  List<Object?> get props => [];
}

class PasswordLoadingState extends PasswordState {
  @override
  List<Object?> get props => [];
}

class PasswordLoadedState extends PasswordState {
  @override
  List<Object?> get props => [];
}

class PasswordWrongState extends PasswordState {
  final String message;

  PasswordWrongState(this.message);

  @override
  List<Object?> get props => [message];
}

class PasswordErrorState extends PasswordState {
  @override
  List<Object?> get props => [];
}
