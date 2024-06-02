// ignore_for_file: must_be_immutable

part of 'profile_bloc.dart';

/// Represents the state of Profile in the application.
class ProfileState extends Equatable {
  ProfileState({this.collegeController, this.profileModelObj});
  TextEditingController? collegeController;
  ProfileModel? profileModelObj;

  @override
  List<Object?> get props => [
        collegeController,
        profileModelObj,
      ];

  ProfileState copyWith(
      {TextEditingController? collegeController,
      ProfileModel? profileModelObj}) {
    return ProfileState(
      collegeController: collegeController ?? this.collegeController,
      profileModelObj: profileModelObj ?? this.profileModelObj,
    );
  }
}
