// ignore_for_file: must_be_immutable

part of 'teachers_bloc.dart';

class TeachersState extends Equatable {
  TeachersState({
    this.nameController,
    this.mobileNumController,
    this.collegeController,
    this.departmentController,
    this.fieldController,
    this.qualificationsController,
    this.postController,
    this.achievementsController,
    this.experienceController,
    this.profilePicController,
    this.usernameController,
    this.passwordController,
    this.teachersModelObj,
  });

  TextEditingController? nameController;
  TextEditingController? mobileNumController;
  TextEditingController? collegeController;
  TextEditingController? departmentController;
  TextEditingController? fieldController;
  TextEditingController? qualificationsController;
  TextEditingController? postController;
  TextEditingController? achievementsController;
  TextEditingController? experienceController;
  TextEditingController? profilePicController;
  TextEditingController? usernameController;
  TextEditingController? passwordController;
  TeachersModel? teachersModelObj;

  @override
  List<Object?> get props => [
        nameController,
        mobileNumController,
        collegeController,
        departmentController,
        fieldController,
        qualificationsController,
        postController,
        achievementsController,
        experienceController,
        profilePicController,
        usernameController,
        passwordController,
        teachersModelObj,
      ];

  TeachersState copyWith({
    TextEditingController? nameController,
    TextEditingController? mobileNumController,
    TextEditingController? collegeController,
    TextEditingController? departmentController,
    TextEditingController? fieldController,
    TextEditingController? qualificationsController,
    TextEditingController? postController,
    TextEditingController? achievementsController,
    TextEditingController? experienceController,
    TextEditingController? profilePicController,
    TextEditingController? usernameController,
    TextEditingController? passwordController,
    TeachersModel? teachersModelObj,
  }) {
    return TeachersState(
      nameController: nameController ?? this.nameController,
      mobileNumController: mobileNumController ?? this.mobileNumController,
      collegeController: collegeController ?? this.collegeController,
      departmentController: departmentController ?? this.departmentController,
      fieldController: fieldController ?? this.fieldController,
      qualificationsController:
          qualificationsController ?? this.qualificationsController,
      postController: postController ?? this.postController,
      achievementsController:
          achievementsController ?? this.achievementsController,
      experienceController: experienceController ?? this.experienceController,
      profilePicController: profilePicController ?? this.profilePicController,
      usernameController: usernameController ?? this.usernameController,
      passwordController: passwordController ?? this.passwordController,
      teachersModelObj: teachersModelObj ?? this.teachersModelObj,
    );
  }
}
