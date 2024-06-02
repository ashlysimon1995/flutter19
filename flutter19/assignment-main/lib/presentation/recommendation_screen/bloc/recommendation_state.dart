// ignore_for_file: must_be_immutable

part of 'recommendation_bloc.dart';

/// Represents the state of Recommendation in the application.
class RecommendationState extends Equatable {
  RecommendationState({
    this.recommendationModelObj,
    // this.userID, this.followerId
  });

  RecommendationModel? recommendationModelObj;

  // int followerId;
  // int userID;

  @override
  // followerId, userID
  List<Object?> get props => [
        recommendationModelObj,
      ];

  RecommendationState copyWith({RecommendationModel? recommendationModelObj}) {
    return RecommendationState(
      recommendationModelObj:
          recommendationModelObj ?? this.recommendationModelObj,
      // followerId: followerId,
      // userID: userID,
    );
  }
}
