import 'package:assignment/core/utils/size_utils.dart';

import '../../core/app_export.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/navigator_service.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';
import 'models/chat_model.dart';
import 'package:flutter/material.dart';
import 'bloc/chat_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ChatBloc>(
        create: (context) => ChatBloc(ChatState(chatModelObj: ChatModel()))
          ..add(ChatInitialEvent()),
        child: ChatScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 13.v),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 38.v),
              _buildEighteen(context),
              SizedBox(height: 25.v),
              _buildThirty(context),
              SizedBox(height: 25.v),
              _buildTwentySix(context),
              SizedBox(height: 25.v),
              _buildThirtyFive(context),
              SizedBox(height: 25.v),
              _buildTwentyOne(context),
              SizedBox(height: 23.v),
              Align(
                  alignment: Alignment.center,
                  child: Divider(indent: 33.h, endIndent: 19.h)),
              SizedBox(height: 10.v),
              Padding(
                  padding: EdgeInsets.only(left: 20.h, right: 48.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 41.v),
                            child: _buildNine(context)),
                        CustomImageView(
                            imagePath: ImageConstant.imgNext,
                            height: 50.v,
                            margin: EdgeInsets.only(left: 20.h, bottom: 48.v),
                            onTap: () {
                              onTapImgNext(context);
                            }),
                        Padding(
                            padding: EdgeInsets.only(top: 41.v),
                            child: _buildNine(context))
                      ])),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 20.h, right: 48.h),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [_buildNine(context), _buildNine(context)]),
              )
            ])),
      )));
    });
  }

  /// Section Widget
  Widget _buildEighteen(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 19.h),
        child: Row(children: [
          CustomImageView(imagePath: ImageConstant.imgProfile, height: 54.v),
          Container(
            height: 44.v,
            width: 215.h,
            margin: EdgeInsets.only(left: 22.h, top: 5.v, bottom: 5.v),
            decoration: BoxDecoration(color: theme.colorScheme.primary),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(),
            ),
          )
        ]));
  }

  /// Section Widget
  Widget _buildThirty(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 19.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(imagePath: ImageConstant.imgProfile, height: 54.v),
          Container(
              height: 44.v,
              width: 215.h,
              margin: EdgeInsets.only(left: 22.h, bottom: 10.v),
              decoration: BoxDecoration(color: theme.colorScheme.primary))
        ]));
  }

  /// Section Widget
  Widget _buildTwentySix(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 19.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(imagePath: ImageConstant.imgProfile, height: 54.v),
          Container(
              height: 44.v,
              width: 215.h,
              margin: EdgeInsets.only(left: 22.h, bottom: 10.v),
              decoration: BoxDecoration(color: theme.colorScheme.primary))
        ]));
  }

  /// Section Widget
  Widget _buildThirtyFive(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 19.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(imagePath: ImageConstant.imgProfile, height: 54.v),
          Container(
              height: 44.v,
              width: 215.h,
              margin: EdgeInsets.only(left: 22.h, bottom: 10.v),
              decoration: BoxDecoration(color: theme.colorScheme.primary))
        ]));
  }

  /// Section Widget
  Widget _buildTwentyOne(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 19.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(imagePath: ImageConstant.imgProfile, height: 54.v),
          Container(
              height: 44.v,
              width: 215.h,
              margin: EdgeInsets.only(left: 22.h, bottom: 10.v),
              decoration: BoxDecoration(color: theme.colorScheme.primary))
        ]));
  }

  /// Common widget
  Widget _buildNine(BuildContext context) {
    return Container(
        height: 67.v,
        width: 84.h,
        padding: EdgeInsets.symmetric(vertical: 5.v),
        decoration: AppDecoration.fillPrimary,
        child: Stack(alignment: Alignment.bottomRight, children: [
          CustomImageView(
              imagePath: ImageConstant.imgProfile,
              width: 45.h,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 6.h)),
          CustomImageView(
              imagePath: ImageConstant.imgAdd,
              height: 32.v,
              alignment: Alignment.bottomRight)
        ]));
  }

  /// Navigates to the eventsScreen when the action is triggered.
  onTapImgNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.eventsScreen,
    );
  }
}
