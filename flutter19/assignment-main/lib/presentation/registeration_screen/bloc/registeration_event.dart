// ignore_for_file: must_be_immutable

part of 'registeration_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Registeration widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RegisterationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Registeration widget is first created.
class RegisterationInitialEvent extends RegisterationEvent {
  @override
  List<Object?> get props => [];
}

class SignInButtonClickedEvent extends RegisterationEvent {
  final String username;
  final String password;

  SignInButtonClickedEvent({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}
