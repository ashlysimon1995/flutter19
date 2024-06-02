// ignore_for_file: must_be_immutable

part of 'verification_bloc.dart';

/// Represents the state of Verification in the application.
class VerificationState extends Equatable {
  VerificationState({
    this.emailController,
    this.verificationModelObj,
  });

  TextEditingController? emailController;

  VerificationModel? verificationModelObj;

  @override
  List<Object?> get props => [
        emailController,
        verificationModelObj,
      ];

  VerificationState copyWith({
    TextEditingController? emailController,
    VerificationModel? verificationModelObj,
  }) {
    return VerificationState(
      emailController: emailController ?? this.emailController,
      verificationModelObj: verificationModelObj ?? this.verificationModelObj,
    );
  }
}
