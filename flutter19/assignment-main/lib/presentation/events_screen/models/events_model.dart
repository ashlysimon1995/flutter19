// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [events_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class EventsModel extends Equatable {
  EventsModel() {}

  EventsModel copyWith() {
    return EventsModel();
  }

  @override
  List<Object?> get props => [];
}
