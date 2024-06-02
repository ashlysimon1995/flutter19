import 'dart:developer';

import 'package:assignment/core/utils/size_utils.dart';
import 'package:assignment/presentation/recommendation_screen/bloc/recommendation_bloc.dart';
import 'package:assignment/theme/app_decoration.dart';
import 'package:assignment/widgets/custom_image_view.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/image_constant.dart';
import '../models/recommendation_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class RecommendationItemWidget extends StatelessWidget {
  RecommendationItemWidget(
    this.recommendationItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  RecommendationItemModel recommendationItemModelObj;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RecommendationBloc>(context);

    return Container(
      height: 80.v,
      width: 112.h,
      padding: EdgeInsets.symmetric(vertical: 7.v),
      decoration: AppDecoration.fillPrimary,
      child: InkWell(
        onTap: () async {
          log(recommendationItemModelObj.id.toString());
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int? userId = prefs.getInt('uid');
          final followerId =
              int.parse(recommendationItemModelObj.id.toString());

          // Dispatch the sign-in event with email and password
          bloc.add(RecommendationFllowButton(
              userId: userId ?? 0, followerId: followerId));
        },
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  recommendationItemModelObj.username.toString(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgProfile,
                      width: 45.h,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 9.h),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgAdd,
                      height: 20.v,
                      alignment: Alignment.bottomRight,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
