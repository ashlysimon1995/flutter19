import 'package:assignment/core/utils/size_utils.dart';

import '../../core/app_export.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/navigator_service.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../widgets/custom_image_view.dart';
import 'models/events_model.dart';
import 'package:flutter/material.dart';
import 'bloc/events_bloc.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<EventsBloc>(
        create: (context) =>
            EventsBloc(EventsState(eventsModelObj: EventsModel()))
              ..add(EventsInitialEvent()),
        child: EventsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsBloc, EventsState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 43.h, vertical: 49.v),
            child: Column(children: [
              Container(
                  height: 121.v,
                  width: 274.h,
                  padding: EdgeInsets.symmetric(vertical: 33.v),
                  decoration: AppDecoration.fillPrimary,
                  child: CustomImageView(
                      imagePath: ImageConstant.imgImage,
                      height: 55.v,
                      alignment: Alignment.center)),
              SizedBox(height: 28.v),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 76.h, vertical: 34.v),
                  decoration: AppDecoration.fillPrimary,
                  child: Column(children: [
                    Divider(),
                    SizedBox(height: 29.v),
                    Divider(),
                    SizedBox(height: 29.v),
                    Divider(),
                    SizedBox(height: 32.v)
                  ])),
              SizedBox(height: 28.v),
              Container(
                  height: 75.v,
                  width: 274.h,
                  padding: EdgeInsets.symmetric(vertical: 1.v),
                  decoration: AppDecoration.fillPrimary,
                  child: CustomImageView(
                      imagePath: ImageConstant.imgImage,
                      height: 55.v,
                      alignment: Alignment.topCenter)),
              SizedBox(height: 62.v),
              CustomImageView(
                  imagePath: ImageConstant.imgNext,
                  height: 60.v,
                  onTap: () {
                    onTapImgNext(context);
                  })
            ])),
      )));
    });
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapImgNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.profileScreen,
    );
  }
}
