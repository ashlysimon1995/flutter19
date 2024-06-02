import 'dart:convert';
import 'dart:developer';

import 'package:assignment/presentation/organization_screen/models/organization_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/api_service.dart';
import '../../../widgets/Appconstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/core/app_export.dart';
part 'organization_event.dart';
part 'organization_state.dart';

/// A bloc that manages the state of a Organization according to the event that is dispatched to it.
class OrganizationBloc extends Bloc<OrganizationEvent, OrganizationState> {
  OrganizationBloc(OrganizationState initialState) : super(initialState) {
    on<OrganizationInitialEvent>(_onInitialize);
    on<OrganizationRegister>(_onRegisterButtonClicked);
  }

  _onInitialize(
    OrganizationInitialEvent event,
    Emitter<OrganizationState> emit,
  ) async {
    emit(state.copyWith(
      collegeNameController: TextEditingController(),
      mobileController: TextEditingController(),
      cityController: TextEditingController(),
      orgEmailController: TextEditingController(),
      profilePicController: TextEditingController(),
      usernameController: TextEditingController(),
      passwordController: TextEditingController(),
    ));
  }

  _onRegisterButtonClicked(
      OrganizationRegister event, Emitter<OrganizationState> emit) async {
    try {
      // log("${event.username}, ${event.password}");
      final response = await ApiService.organizationRegister(
          event.username,
          event.password,
          event.mobile,
          event.collegeName,
          event.city,
          event.orgEmail,
          event.profilePic);

      if (response.statusCode == 200) {
        final responseString = await response.stream.bytesToString();
        final Map<String, dynamic> responseData = json.decode(responseString);
        final int uid = responseData['uid'];
        String username =
            responseData['username']; //ADDED THESE 13 LINES OF CODE
        String mobile = responseData['mobile'];
        String college = responseData['college'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isAuthenticated', true);
        prefs.setInt('uid', uid);
        prefs.setString('username', username);
        prefs.setString('mobile', mobile);
        prefs.setString('college', college);

        Appconstant().toast(toast: "Logged in Successfully", clr: Colors.green);
        NavigatorService.popAndPushNamed(
          AppRoutes.recommendationScreen,
        );
      } else {
        log(await response.stream.bytesToString());
        log(response.statusCode.toString());
        Appconstant().toast(toast: "Failed to Register");
      }
    } catch (e) {
      Appconstant().toast(toast: "Failed to Register");
    }
  }
}
