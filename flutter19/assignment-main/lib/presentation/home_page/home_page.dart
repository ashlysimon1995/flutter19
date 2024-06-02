import 'package:assignment/core/utils/size_utils.dart';
import 'package:assignment/localization/app_localization.dart';
import 'package:assignment/theme/theme_helper.dart';
import 'package:assignment/widgets/custom_elevated_button.dart';

import '../../core/app_export.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/navigator_service.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../widgets/custom_image_view.dart';
import 'models/home_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(HomeState(homeModelObj: HomeModel()))
          ..add(HomeInitialEvent()),
        child: HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillOnPrimary,
            child: Column(children: [
              SizedBox(height: 37.v),
              _buildSixtyOne(context),
              SizedBox(height: 70.v),
              CustomElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('isAuthenticated', false);
                    NavigatorService.pushNamed(
                      AppRoutes.registerationScreen,
                    );
                  },
                  height: 42.v,
                  text: "Logout",
                  margin: EdgeInsets.only(left: 38.h, right: 19.h),
                  buttonTextStyle: theme.textTheme.titleLarge!),
              SizedBox(height: 70.v),
              Padding(
                  padding: EdgeInsets.only(left: 23.h, right: 60.h),
                  child: _buildTwenty(context)),
              SizedBox(height: 30.v),
              Padding(
                  padding: EdgeInsets.only(left: 23.h, right: 60.h),
                  child: _buildTwenty(context)),
              SizedBox(height: 30.v),
              _buildSixtyThree(context)
            ])),
      )));
    });
  }

  /// Section Widget
  Widget _buildSixtyOne(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(right: 30.h),
            child: Row(children: [
              CustomImageView(
                  imagePath: ImageConstant.imgProfile, height: 97.v),
              Container(
                  width: 212.h,
                  margin: EdgeInsets.only(left: 8.h, top: 25.v, bottom: 21.v),
                  padding: EdgeInsets.symmetric(vertical: 2.v),
                  decoration: AppDecoration.fillPrimary,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 12.v, bottom: 4.v),
                            child: Text("lbl_search".tr,
                                style: theme.textTheme.headlineSmall)),
                        CustomImageView(
                            imagePath: ImageConstant.imgFilter,
                            height: 34.v,
                            margin: EdgeInsets.only(top: 12.v))
                      ]))
            ])));
  }

  /// Section Widget
  Widget _buildSixtyThree(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(left: 23.h, right: 47.h),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgProfile,
                  width: 64.h,
                  margin: EdgeInsets.only(top: 2.v, bottom: 56.v)),
              Container(
                  height: 128.v,
                  width: 217.h,
                  margin: EdgeInsets.only(left: 9.h),
                  child: Stack(alignment: Alignment.bottomRight, children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.only(right: 13.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 56.h, vertical: 15.v),
                            decoration: AppDecoration.fillPrimary,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 76.h, child: Divider()),
                                  SizedBox(height: 19.v),
                                  SizedBox(width: 76.h, child: Divider()),
                                  SizedBox(height: 19.v),
                                  SizedBox(width: 76.h, child: Divider())
                                ]))),
                    CustomImageView(
                        imagePath: ImageConstant.imgNext,
                        height: 60.v,
                        alignment: Alignment.bottomRight,
                        onTap: () {
                          onTapImgNext(context);
                        })
                  ]))
            ])));
  }

  /// Common widget
  Widget _buildTwenty(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomImageView(
          imagePath: ImageConstant.imgProfile,
          width: 64.h,
          margin: EdgeInsets.only(bottom: 16.v)),
      Container(
          height: 86.v,
          width: 204.h,
          margin: EdgeInsets.only(left: 9.h),
          padding: EdgeInsets.symmetric(horizontal: 58.h, vertical: 10.v),
          decoration: AppDecoration.fillPrimary,
          child: CustomImageView(
              imagePath: ImageConstant.imgImage,
              height: 65.v,
              alignment: Alignment.center))
    ]);
  }

  /// Navigates to the chatScreen when the action is triggered.
  onTapImgNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.chatScreen,
    );
  }
}
