part of 'email_bloc.dart';

@immutable
abstract class EmailEvent extends Equatable {}

class EmailSentEvent extends EmailEvent {
  final String email;

  EmailSentEvent({
    required this.email,
  });


  @override
  List<Object?> get props => [email];
}

class Reset extends EmailEvent {
  @override

  List<Object?> get props => [];

}
