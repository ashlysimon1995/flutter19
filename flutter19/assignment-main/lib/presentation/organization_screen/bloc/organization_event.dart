// ignore_for_file: must_be_immutable

part of 'organization_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Organization widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class OrganizationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Organization widget is first created.
class OrganizationInitialEvent extends OrganizationEvent {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when an organization registers.
class OrganizationRegister extends OrganizationEvent {
  final String collegeName;
  final String mobile;
  final String city;
  final String orgEmail;
  final String profilePic;
  final String username;
  final String password;

  OrganizationRegister({
    required this.collegeName,
    required this.mobile,
    required this.city,
    required this.orgEmail,
    required this.profilePic,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [
        collegeName,
        mobile,
        city,
        orgEmail,
        profilePic,
        username,
        password,
      ];
}
