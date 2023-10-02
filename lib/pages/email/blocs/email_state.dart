part of 'email_bloc.dart';

@immutable
abstract class EmailState extends Equatable {}

class EmailInitial extends EmailState {
  @override
  List<Object?> get props => [];
}

class EmailLoadingState extends EmailState {
  @override
  List<Object?> get props => [];
}

class EmailLoadedState extends EmailState {
  @override
  List<Object?> get props => [];
}

class EmailErrorState extends EmailState {
  @override
  List<Object?> get props => [];
}
