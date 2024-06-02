import 'dart:convert';
import 'dart:developer';

import 'package:assignment/core/utils/api_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../widgets/Appconstant.dart';
import '../models/teachers_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/core/app_export.dart';
part 'teachers_event.dart';
part 'teachers_state.dart';

/// A bloc that manages the state of a Teachers according to the event that is dispatched to it.
class TeachersBloc extends Bloc<TeachersEvent, TeachersState> {
  TeachersBloc(TeachersState initialState) : super(initialState) {
    on<TeachersInitialEvent>(_onInitialize);
    on<TeacherRegister>(_onRegisterButtonClicked);
  }

  _onInitialize(
    TeachersInitialEvent event,
    Emitter<TeachersState> emit,
  ) async {
    emit(state.copyWith(
      nameController: TextEditingController(),
      mobileNumController: TextEditingController(),
      collegeController: TextEditingController(),
      departmentController: TextEditingController(),
      fieldController: TextEditingController(),
      qualificationsController: TextEditingController(),
      postController: TextEditingController(),
      achievementsController: TextEditingController(),
      experienceController: TextEditingController(),
      profilePicController: TextEditingController(),
      usernameController: TextEditingController(),
      passwordController: TextEditingController(),
    ));
  }

  _onRegisterButtonClicked(
      TeacherRegister event, Emitter<TeachersState> emit) async {
    try {
      // log("${event.username}, ${event.password}");
      final response = await ApiService.teacherRegister(
        event.username,
        event.password,
        event.mobileNum,
        event.name,
        event.college,
        event.department,
        event.achievements,
        event.qualifications,
        event.experience,
      );

      if (response.statusCode == 200) {
        final responseString = await response.stream.bytesToString();
        final Map<String, dynamic> responseData = json.decode(responseString);
        final int uid = responseData['uid']; //ADDED THESE 12 LINES OF CODE
        late String username = responseData['username'];
        late String mobile = responseData['mobile'];
        late String college = responseData['college'];
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
        // log(await response.stream.bytesToString());
        log(response.statusCode.toString());
        Appconstant().toast(toast: "Failed to Register teacher1");
      }
    } catch (e) {
      Appconstant().toast(toast: "Failed to Register teacher2");
    }
  }
}
