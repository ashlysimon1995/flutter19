import 'dart:convert';
import 'dart:developer';

import 'package:assignment/core/utils/api_service.dart';
import 'package:assignment/presentation/recommendation_screen/models/recommendation_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../widgets/Appconstant.dart';
import '/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/recommendation_item_model.dart';
part 'recommendation_event.dart';
part 'recommendation_state.dart';

/// A bloc that manages the state of a Recommendation according to the event that is dispatched to it.
class RecommendationBloc
    extends Bloc<RecommendationEvent, RecommendationState> {
  int uid = 0;
  RecommendationBloc(RecommendationState initialState) : super(initialState) {
    on<RecommendationInitialEvent>(_onInitialize);
    on<RecommendationFllowButton>(_onFllowButtonClicked);
  }

  // _onInitialize(
  //   RecommendationInitialEvent event,
  //   Emitter<RecommendationState> emit,
  // ) async {
  //   emit(state.copyWith(
  //       recommendationModelObj: state.recommendationModelObj
  //           ?.copyWith(recommendationItemList: fillRecommendationItemList())));
  // }
  _onInitialize(
    RecommendationInitialEvent event,
    Emitter<RecommendationState> emit,
  ) async {
    // Fetch the recommendation item list and wait for it to complete
    List<RecommendationItemModel> recommendationItemList =
        await fillRecommendationItemList();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the value of the 'uid' preference
    uid = prefs.getInt('uid') ?? 0;


    emit(state.copyWith(
      recommendationModelObj: state.recommendationModelObj?.copyWith(
        recommendationItemList: recommendationItemList,
      ),
    ));
  }

  Future<List<RecommendationItemModel>> fillRecommendationItemList() async {
    List<RecommendationItemModel> recommendationItemList = [];

    try {
      final response = await ApiService.getRecommendedUser(uid);

      if (response.statusCode == 200) {
        // Check if the response body is not empty
        if (response.contentLength == 0) {
          // If the response body is empty, handle it accordingly
          Appconstant().toast(toast: "Empty response received");
          return recommendationItemList; // or throw an error, depending on your application logic
        }

        // Convert the response body to a String
        String responseBody = await response.stream.bytesToString();

        // Check if the response body is valid JSON
        if (responseBody.isEmpty) {
          // If the response body is empty, handle it accordingly
          Appconstant().toast(toast: "Empty JSON response received");
          return recommendationItemList; // or throw an error, depending on your application logic
        }

        // Decode the JSON response
        var result = json.decode(responseBody);

        // Parse the 'data' list and create RecommendationItemModel instances
        for (var user in (result['data'] as List)) {
          RecommendationItemModel recommendationItem = RecommendationItemModel(
            id: user['id'].toString(),
            username: user['username'],
          );
          recommendationItemList.add(recommendationItem);
        }

        // show toast message
        Appconstant().toast(toast: "Fetched Recommended User", clr: Colors.green);

        return recommendationItemList;
      } else {
        log(await response.stream.bytesToString());
        log(response.statusCode.toString());
        Appconstant().toast(toast: "No user Recommended user found for your college");
      }
    } catch (e) {
      log(e.toString());
      Appconstant().toast(toast: "Something went wrong");
    }

// Return a list of empty RecommendationItemModel if an error occurs or no data is fetched
    return recommendationItemList;

  }

  _onFllowButtonClicked(RecommendationFllowButton event,
      Emitter<RecommendationState> emit) async {
    try {
      log("${event.userId}, ${event.followerId}");

      final response =
          await ApiService.sendFllowRequest(event.userId, event.followerId);

      if (response.statusCode == 200) {
        Appconstant().toast(toast: "Sucessfully followed", clr: Colors.green);
      } else {
        var result = json.decode(await response.stream.bytesToString());
        log(result.toString());
        Appconstant().toast(toast: result['error']);
      }
    } catch (e) {
      debugPrint(e.toString());
      Appconstant().toast(toast: "Something went wrong");
    }
  }
}
