// ignore_for_file: must_be_immutable

part of 'profile_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Profile widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Profile widget is first created.
class ProfileInitialEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class ProfileRegister extends ProfileEvent {
  final String college;

  ProfileRegister({
    required this.college,
  });

  @override
  List<Object?> get props => [
        college,
      ];
}
