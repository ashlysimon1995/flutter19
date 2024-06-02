// ignore_for_file: must_be_immutable

part of 'organization_bloc.dart';

class OrganizationState extends Equatable {
  OrganizationState({
    this.collegeNameController,
    this.mobileController,
    this.cityController,
    this.orgEmailController,
    this.profilePicController,
    this.usernameController,
    this.passwordController,
    this.organizationModelObj,
  });

  TextEditingController? collegeNameController;
  TextEditingController? mobileController;
  TextEditingController? cityController;
  TextEditingController? orgEmailController;
  TextEditingController? profilePicController;
  TextEditingController? usernameController;
  TextEditingController? passwordController;
  OrganizationModel? organizationModelObj;

  @override
  List<Object?> get props => [
        collegeNameController,
        mobileController,
        cityController,
        orgEmailController,
        profilePicController,
        usernameController,
        passwordController,
        organizationModelObj,
      ];

  OrganizationState copyWith({
    TextEditingController? collegeNameController,
    TextEditingController? mobileController,
    TextEditingController? cityController,
    TextEditingController? orgEmailController,
    TextEditingController? profilePicController,
    TextEditingController? usernameController,
    TextEditingController? passwordController,
    OrganizationModel? organizationModelObj,
  }) {
    return OrganizationState(
      collegeNameController:
          collegeNameController ?? this.collegeNameController,
      mobileController: mobileController ?? this.mobileController,
      cityController: cityController ?? this.cityController,
      orgEmailController: orgEmailController ?? this.orgEmailController,
      profilePicController: profilePicController ?? this.profilePicController,
      usernameController: usernameController ?? this.usernameController,
      passwordController: passwordController ?? this.passwordController,
      organizationModelObj: organizationModelObj ?? this.organizationModelObj,
    );
  }
}
