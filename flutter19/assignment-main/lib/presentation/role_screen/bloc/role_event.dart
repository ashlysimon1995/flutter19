// ignore_for_file: must_be_immutable

part of 'role_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Role widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RoleEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Role widget is first created.
class RoleInitialEvent extends RoleEvent {
  @override
  List<Object?> get props => [];
}
