// ignore_for_file: must_be_immutable

part of 'students_bloc.dart';

/// Represents the state of Students in the application.
class StudentsState extends Equatable {
  StudentsState({
    this.nameController,
    this.usernameController,
    this.passwordController,
    this.mobileNumController,
    this.cOLLEGEController,
    this.dEGREEController,
    this.cORESKILLSController,
    this.hOBBIESController,
    this.achievementsController,
    this.studentsModelObj,
  });

  TextEditingController? nameController;
  TextEditingController? usernameController;
  TextEditingController? passwordController;
  TextEditingController? cOLLEGEController;
  TextEditingController? dEGREEController;
  TextEditingController? cORESKILLSController;
  TextEditingController? hOBBIESController;
  TextEditingController? achievementsController;
  TextEditingController? mobileNumController;

  StudentsModel? studentsModelObj;

  @override
  List<Object?> get props => [
        nameController,
        usernameController,
        passwordController,
        mobileNumController,
        cOLLEGEController,
        dEGREEController,
        cORESKILLSController,
        hOBBIESController,
        achievementsController,
        studentsModelObj,
      ];

  StudentsState copyWith({
    TextEditingController? nameController,
    TextEditingController? usernameController,
    TextEditingController? passwordController,
    TextEditingController? mobileNumController,
    TextEditingController? cOLLEGEController,
    TextEditingController? dEGREEController,
    TextEditingController? cORESKILLSController,
    TextEditingController? hOBBIESController,
    TextEditingController? achievementsController,
    StudentsModel? studentsModelObj,
  }) {
    return StudentsState(
      nameController: nameController ?? this.nameController,
      usernameController: usernameController ?? this.usernameController,
      passwordController: passwordController ?? this.passwordController,
      mobileNumController: mobileNumController ?? this.mobileNumController,
      cOLLEGEController: cOLLEGEController ?? this.cOLLEGEController,
      dEGREEController: dEGREEController ?? this.dEGREEController,
      cORESKILLSController: cORESKILLSController ?? this.cORESKILLSController,
      hOBBIESController: hOBBIESController ?? this.hOBBIESController,
      achievementsController:
          achievementsController ?? this.achievementsController,
      studentsModelObj: studentsModelObj ?? this.studentsModelObj,
    );
  }
}
