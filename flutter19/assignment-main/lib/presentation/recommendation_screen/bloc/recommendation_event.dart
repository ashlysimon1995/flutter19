// ignore_for_file: must_be_immutable

part of 'recommendation_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Recommendation widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RecommendationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Recommendation widget is first created.
class RecommendationInitialEvent extends RecommendationEvent {
  @override
  List<Object?> get props => [];
}

class RecommendationFllowButton extends RecommendationEvent {
  final int userId;
  final int followerId;

  RecommendationFllowButton({required this.userId, required this.followerId});

  @override
  List<Object?> get props => [userId, followerId];
}
