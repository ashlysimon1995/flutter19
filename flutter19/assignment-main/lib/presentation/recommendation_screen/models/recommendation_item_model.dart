/// This class is used in the [recommendation_item_widget] screen.
class RecommendationItemModel {
  RecommendationItemModel({this.id, this.username}) {
    id = id ?? "";
    username = username ?? "";
  }

  String? id;
  String? username;
}
