import 'dart:convert';
import 'dart:developer';

import 'package:assignment/core/utils/api_service.dart';
import 'package:assignment/presentation/students_screen/models/students_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../widgets/Appconstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/core/app_export.dart';
part 'students_event.dart';
part 'students_state.dart';

/// A bloc that manages the state of a Students according to the event that is dispatched to it.
class StudentsBloc extends Bloc<StudentsEvent, StudentsState> {
  StudentsBloc(StudentsState initialState) : super(initialState) {
    on<StudentsInitialEvent>(_onInitialize);
    on<StudentRegister>(_onRegisterButtonClicked);
  }

  _onInitialize(
    StudentsInitialEvent event,
    Emitter<StudentsState> emit,
  ) async {
    emit(state.copyWith(
        usernameController: TextEditingController(),
        passwordController: TextEditingController(),
        mobileNumController: TextEditingController(),
        nameController: TextEditingController(),
        cOLLEGEController: TextEditingController(),
        dEGREEController: TextEditingController(),
        cORESKILLSController: TextEditingController(),
        hOBBIESController: TextEditingController(),
        achievementsController: TextEditingController()));
  }

  _onRegisterButtonClicked(
      StudentRegister event, Emitter<StudentsState> emit) async {
    try {
      // log("${event.username}, ${event.password}");
      final response = await ApiService.studentRegister(
        event.username,
        event.password,
        event.name,
        event.mobileNum,
        event.cOLLEGE,
        event.dEGREE,
        event.cORESKILLS,
        event.hOBBIES,
        event.achievements,
      );

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
        Appconstant().toast(toast: "Failed to Register student");
      }
    } catch (e) {
      Appconstant().toast(toast: "Failed to Register student");
    }
  }
}
