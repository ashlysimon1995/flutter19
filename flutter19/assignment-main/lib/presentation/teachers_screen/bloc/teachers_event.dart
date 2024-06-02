// ignore_for_file: must_be_immutable

part of 'teachers_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Teachers widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class TeachersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Teachers widget is first created.
class TeachersInitialEvent extends TeachersEvent {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when a teacher registers.
class TeacherRegister extends TeachersEvent {
  final String name;
  final String mobileNum;
  final String college;
  final String department;
  final String field;
  final String qualifications;
  final String post;
  final String achievements;
  final String experience;
  final String profilePic;
  final String username;
  final String password;

  TeacherRegister({
    required this.name,
    required this.mobileNum,
    required this.college,
    required this.department,
    required this.field,
    required this.qualifications,
    required this.post,
    required this.achievements,
    required this.experience,
    required this.profilePic,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [
        name,
        mobileNum,
        college,
        department,
        field,
        qualifications,
        post,
        achievements,
        experience,
        profilePic,
        username,
        password,
      ];
}
