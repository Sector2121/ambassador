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

class PasswordErrorState extends PasswordState {
  @override
  List<Object?> get props => [];
}
