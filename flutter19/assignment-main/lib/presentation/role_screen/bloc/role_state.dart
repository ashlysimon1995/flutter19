// ignore_for_file: must_be_immutable

part of 'role_bloc.dart';

/// Represents the state of Role in the application.
class RoleState extends Equatable {
  RoleState({this.roleModelObj});

  RoleModel? roleModelObj;

  @override
  List<Object?> get props => [
        roleModelObj,
      ];

  RoleState copyWith({RoleModel? roleModelObj}) {
    return RoleState(
      roleModelObj: roleModelObj ?? this.roleModelObj,
    );
  }
}
