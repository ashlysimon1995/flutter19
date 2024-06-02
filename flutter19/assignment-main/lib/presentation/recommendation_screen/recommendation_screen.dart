import 'package:assignment/core/utils/image_constant.dart';
import 'package:assignment/core/utils/navigator_service.dart';
import 'package:assignment/core/utils/size_utils.dart';
import 'package:assignment/localization/app_localization.dart';
import 'package:assignment/routes/app_routes.dart';
import 'package:assignment/theme/theme_helper.dart';
import 'package:assignment/widgets/custom_image_view.dart';

import '../../core/app_export.dart';
import 'widgets/recommendation_item_widget.dart';
import 'models/recommendation_item_model.dart';
import 'models/recommendation_model.dart';
import 'package:flutter/material.dart';
import 'bloc/recommendation_bloc.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<RecommendationBloc>(
        create: (context) => RecommendationBloc(
            RecommendationState(recommendationModelObj: RecommendationModel()))
          ..add(RecommendationInitialEvent()),
        child: RecommendationScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 43.h, vertical: 56.v),
          child: Column(children: [
            SizedBox(height: 11.v),
            Text("lbl_recommendation".tr, style: theme.textTheme.headlineSmall),
            SizedBox(height: 74.v),
            _buildRECOMMENDATION(context),
            SizedBox(height: 38.v),
            CustomImageView(
                imagePath: ImageConstant.imgNext,
                height: 60.v,
                onTap: () {
                  onTapImgNext(context);
                })
          ])),
    )));
  }

  /// Section Widget
  Widget _buildRECOMMENDATION(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.h),
        child: BlocSelector<RecommendationBloc, RecommendationState,
                RecommendationModel?>(
            selector: (state) => state.recommendationModelObj,
            builder: (context, recommendationModelObj) {
              return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 81.v,
                      crossAxisCount: 2,
                      mainAxisSpacing: 33.h,
                      crossAxisSpacing: 33.h),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:
                      recommendationModelObj?.recommendationItemList.length ??
                          0,
                  itemBuilder: (context, index) {
                    RecommendationItemModel model =
                        recommendationModelObj?.recommendationItemList[index] ??
                            RecommendationItemModel();
                    return RecommendationItemWidget(model);
                  });
            }));
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapImgNext(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}
