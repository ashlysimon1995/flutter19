// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [students_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class StudentsModel extends Equatable {
  StudentsModel() {}

  StudentsModel copyWith() {
    return StudentsModel();
  }

  @override
  List<Object?> get props => [];
}
