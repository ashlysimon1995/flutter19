
import 'package:assignment/core/app_export.dart';
import 'package:assignment/core/utils/image_constant.dart';
import 'package:assignment/core/utils/navigator_service.dart';
import 'package:assignment/core/utils/size_utils.dart';
import 'package:assignment/core/utils/validation_functions.dart';
import 'package:assignment/localization/app_localization.dart';
import 'package:assignment/routes/app_routes.dart';
import 'package:assignment/theme/theme_helper.dart';
import 'package:assignment/widgets/custom_image_view.dart';
import 'package:assignment/widgets/custom_text_form_field.dart';

import 'models/verification_model.dart';
import 'package:flutter/material.dart';
import 'bloc/verification_bloc.dart';

// ignore_for_file: must_be_immutable
class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<VerificationBloc>(
        create: (context) => VerificationBloc(
            VerificationState(verificationModelObj: VerificationModel()))
          ..add(VerificationInitialEvent()),
        child: VerificationScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Form(
                            key: _formKey,
                            child: Container(
                                width: double.maxFinite,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 35.h, vertical: 89.v),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("lbl_verification".tr,
                                          style: theme.textTheme.headlineSmall),
                                      SizedBox(height: 52.v),
                                      BlocSelector<
                                              VerificationBloc,
                                              VerificationState,
                                              TextEditingController?>(
                                          selector: (state) =>
                                              state.emailController,
                                          builder: (context, emailController) {
                                            return CustomTextFormField(
                                                controller: emailController,
                                                hintText:
                                                    "msg_college_email_id".tr,
                                                hintStyle:
                                                    theme.textTheme.titleLarge!,
                                                textInputAction:
                                                    TextInputAction.done,
                                                textInputType:
                                                    TextInputType.emailAddress,
                                                validator: (value) {
                                                  if (value == null ||
                                                      (!isValidEmail(value,
                                                          isRequired: true))) {
                                                    return "err_msg_please_enter_valid_email"
                                                        .tr;
                                                  }
                                                  return null;
                                                },
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 16.h,
                                                        vertical: 15.v),
                                                borderDecoration:
                                                    TextFormFieldStyleHelper
                                                        .fillPrimary,
                                                filled: true,
                                                fillColor:
                                                    theme.colorScheme.primary);
                                          }),
                                      Spacer(),
                                      SizedBox(height: 25.v),
                                      CustomImageView(
                                          imagePath: ImageConstant.imgNext,
                                          height: 60.v,
                                          onTap: () {
                                            onTapImgNext(context);
                                          })
                                    ]))))))));
  }

  /// Navigates to the recommendationScreen when the action is triggered.
  onTapImgNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.recommendationScreen,
    );
  }
}
