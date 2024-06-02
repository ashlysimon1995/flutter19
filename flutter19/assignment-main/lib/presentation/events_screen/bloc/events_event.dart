// ignore_for_file: must_be_immutable

part of 'events_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Events widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class EventsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Events widget is first created.
class EventsInitialEvent extends EventsEvent {
  @override
  List<Object?> get props => [];
}
