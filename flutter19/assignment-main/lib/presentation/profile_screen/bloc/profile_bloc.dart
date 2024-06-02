import 'package:assignment/core/utils/api_service.dart';
import 'package:assignment/presentation/profile_screen/models/profile_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../widgets/Appconstant.dart';
import '/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'profile_event.dart';
part 'profile_state.dart';

/// A bloc that manages the state of a Profile according to the event that is dispatched to it.
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(ProfileState initialState) : super(initialState) {
    on<ProfileInitialEvent>(_onInitialize);
    on<ProfileRegister>(_onRegisterButtonClicked);
  }

  _onInitialize(
    ProfileInitialEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(collegeController: TextEditingController()));
  }

  _onRegisterButtonClicked(
      ProfileRegister event, Emitter<ProfileState> emit) async {
    try {
      // log("${event.username}, ${event.password}");
      print(event.college);
      final response = await ApiService.profileRegister(
        event.college,
      );

      if (response.statusCode == 200) {
        print("it worked1");
      } else {
        // log(await response.stream.bytesToString());
        Appconstant().toast(toast: "Failed to Register teacher1");
      }
    } catch (e) {
      Appconstant().toast(toast: "Failed to Register teacher2");
    }
  }
}
