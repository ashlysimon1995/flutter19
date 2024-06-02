import 'package:assignment/core/utils/image_constant.dart';
import 'package:assignment/core/utils/navigator_service.dart';
import 'package:assignment/core/utils/size_utils.dart';
import 'package:assignment/localization/app_localization.dart';
import 'package:assignment/routes/app_routes.dart';
import 'package:assignment/widgets/custom_elevated_button.dart';
import 'package:assignment/widgets/custom_image_view.dart';

import '../../core/app_export.dart';
import 'models/role_model.dart';
import 'package:flutter/material.dart';
import 'bloc/role_bloc.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<RoleBloc>(
        create: (context) => RoleBloc(RoleState(roleModelObj: RoleModel()))
          ..add(RoleInitialEvent()),
        child: RoleScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoleBloc, RoleState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 9.h),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 47.v),
                        CustomElevatedButton(
                          text: "lbl_student".tr,
                          onPressed: () {
                            NavigatorService.pushNamed(
                              AppRoutes.studentsScreen,
                            );
                          },
                        ),
                        SizedBox(height: 31.v),
                        CustomElevatedButton(
                          text: "lbl_teacher_faculty".tr,
                          onPressed: () {
                            NavigatorService.pushNamed(
                              AppRoutes.teachersScreen,
                            );
                          },
                        ),
                        SizedBox(height: 31.v),
                        CustomElevatedButton(
                          text: "lbl_organization".tr,
                          onPressed: () {
                            NavigatorService.pushNamed(
                              AppRoutes.organizationScreen,
                            );
                          },
                        ),
                        SizedBox(height: 83.v),
                        // CustomImageView(
                        //     imagePath: ImageConstant.imgNext,
                        //     height: 60.v,
                        //     onTap: () {
                        //       onTapImgNext(context);
                        //     })
                      ]))));
    });
  }

  /// Navigates to the studentsScreen when the action is triggered.
  onTapImgNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.studentsScreen,
    );
  }
}
