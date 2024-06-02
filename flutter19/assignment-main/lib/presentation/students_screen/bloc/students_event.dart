// ignore_for_file: must_be_immutable

part of 'students_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Students widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class StudentsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Students widget is first created.
class StudentsInitialEvent extends StudentsEvent {
  @override
  List<Object?> get props => [];
}

class StudentRegister extends StudentsEvent {
  final String username;
  final String password;
  final String name;
  final String mobileNum;
  final String cOLLEGE;
  final String dEGREE;
  final String cORESKILLS;
  final String hOBBIES;
  final String achievements;

  StudentRegister(
      {required this.name,
      required this.cOLLEGE,
      required this.dEGREE,
      required this.cORESKILLS,
      required this.hOBBIES,
      required this.achievements,
      required this.mobileNum,
      required this.username,
      required this.password});

  @override
  List<Object?> get props => [
        username,
        password,
        mobileNum,
        name,
        cOLLEGE,
        dEGREE,
        cORESKILLS,
        hOBBIES,
        achievements
      ];
}
