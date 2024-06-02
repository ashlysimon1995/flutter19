import 'package:assignment/core/utils/image_constant.dart';
import 'package:assignment/core/utils/validation_functions.dart';
import 'package:assignment/localization/app_localization.dart';
import 'package:assignment/theme/theme_helper.dart';
import 'package:assignment/widgets/custom_image_view.dart';
import 'package:assignment/widgets/custom_text_form_field.dart';

import '../../core/app_export.dart';
import '../../core/utils/navigator_service.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../widgets/custom_elevated_button.dart';
import 'models/teachers_model.dart';
import 'package:flutter/material.dart';
import 'bloc/teachers_bloc.dart';

// ignore_for_file: must_be_immutable
class TeachersScreen extends StatelessWidget {
  TeachersScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<TeachersBloc>(
        create: (context) =>
            TeachersBloc(TeachersState(teachersModelObj: TeachersModel()))
              ..add(TeachersInitialEvent()),
        child: TeachersScreen());
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TeachersBloc>(context);

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
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
                                    horizontal: 38.h, vertical: 22.v),
                                child: Column(children: [
                                  Text("lbl_teachers".tr,
                                      style: theme.textTheme.bodyLarge),
                                  SizedBox(height: 32.v),
                                  _buildUserName(context),
                                  SizedBox(height: 16.v),
                                  _buildPassword(context),
                                  SizedBox(height: 16.v),
                                  _buildMobile(context),
                                  SizedBox(height: 16.v),
                                  _buildName(context),
                                  SizedBox(height: 16.v),
                                  _buildCOLLEGE(context),
                                  SizedBox(height: 16.v),
                                  _buildDepartment(context),
                                  SizedBox(height: 16.v),
                                  _buildAchievement(context),
                                  SizedBox(height: 16.v),
                                  _buildQualification(context),
                                  SizedBox(height: 16.v),
                                  _buildExperience(context),
                                  SizedBox(height: 25.v),
                                  CustomElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          final username = bloc
                                              .state.usernameController?.text;
                                          final password = bloc
                                              .state.passwordController?.text;
                                          final mobile = bloc
                                              .state.mobileNumController?.text;
                                          final name =
                                              bloc.state.nameController?.text;
                                          final cOLLEGE = bloc
                                              .state.collegeController?.text;
                                          final department = bloc
                                              .state.departmentController?.text;
                                          final experience = bloc
                                              .state.experienceController?.text;
                                          final qualification = bloc.state
                                              .qualificationsController?.text;
                                          final achievements = bloc.state
                                              .achievementsController?.text;

                                          bloc.add(TeacherRegister(
                                              username: username ?? "",
                                              password: password ?? "",
                                              name: name ?? "",
                                              college: cOLLEGE ?? "",
                                              department: department ?? "",
                                              experience: experience ?? "",
                                              achievements: achievements ?? "",
                                              qualifications:
                                                  qualification ?? "",
                                              mobileNum: mobile ?? "",
                                              field: '',
                                              post: '',
                                              profilePic: ''));
                                        }
                                        onTapImgNext(context);
                                      },
                                      height: 42.v,
                                      text: "Register",
                                      margin: EdgeInsets.only(
                                          left: 38.h, right: 19.h),
                                      buttonTextStyle:
                                          theme.textTheme.titleLarge!),
                                ]))))))));
  }

  /// Navigates to the organizationScreen when the action is triggered.
  onTapImgNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.organizationScreen,
    );
  }

  Widget _buildUserName(BuildContext context) {
    return BlocSelector<TeachersBloc, TeachersState, TextEditingController?>(
        selector: (state) => state.usernameController,
        builder: (context, usernameController) {
          return CustomTextFormField(
              controller: usernameController,
              hintText: "lbl_username".tr,
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email as user name".tr;
                }
                return null;
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 21.h));
        });
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return BlocSelector<TeachersBloc, TeachersState, TextEditingController?>(
        selector: (state) => state.passwordController,
        builder: (context, passwordController) {
          return CustomTextFormField(
              controller: passwordController,
              hintText: "lbl_password".tr,
              obscureText: true,
              validator: (value) {
                // if (!isText(value)) {
                //   return "err_msg_please_enter_valid_text".tr;
                // }
                return null;
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 21.h));
        });
  }

  Widget _buildMobile(BuildContext context) {
    return BlocSelector<TeachersBloc, TeachersState, TextEditingController?>(
        selector: (state) => state.mobileNumController,
        builder: (context, mobileNumController) {
          return CustomTextFormField(
              controller: mobileNumController,
              hintText: "MOBILE",
              validator: (value) {
                if (value == null) {
                  return "mobile is required";
                }
                // if (isText(value)) {
                //   return "err_msg_please_enter_valid_text".tr;
                // }
                // return null;
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 21.h));
        });
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return BlocSelector<TeachersBloc, TeachersState, TextEditingController?>(
        selector: (state) => state.nameController,
        builder: (context, nameController) {
          return CustomTextFormField(
              controller: nameController,
              hintText: "lbl_name".tr,
              validator: (value) {
                if (!isText(value)) {
                  return "err_msg_please_enter_valid_text".tr;
                }
                return null;
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 21.h));
        });
  }

  /// Section Widget
  Widget _buildCOLLEGE(BuildContext context) {
    return BlocSelector<TeachersBloc, TeachersState, TextEditingController?>(
        selector: (state) => state.collegeController,
        builder: (context, cOLLEGEController) {
          return CustomTextFormField(
              controller: cOLLEGEController,
              hintText: "lbl_college".tr,
              contentPadding: EdgeInsets.symmetric(horizontal: 21.h));
        });
  }

  Widget _buildQualification(BuildContext context) {
    return BlocSelector<TeachersBloc, TeachersState, TextEditingController?>(
        selector: (state) => state.qualificationsController,
        builder: (context, qualificationsController) {
          return CustomTextFormField(
              controller: qualificationsController,
              hintText: "lbl_qualification".tr,
              contentPadding: EdgeInsets.symmetric(horizontal: 21.h));
        });
  }

  /// Section Widget
  Widget _buildDepartment(BuildContext context) {
    return BlocSelector<TeachersBloc, TeachersState, TextEditingController?>(
        selector: (state) => state.departmentController,
        builder: (context, departmentController) {
          return CustomTextFormField(
              controller: departmentController,
              hintText: "lbl_department".tr,
              contentPadding: EdgeInsets.symmetric(horizontal: 21.h));
        });
  }

  Widget _buildAchievement(BuildContext context) {
    return BlocSelector<TeachersBloc, TeachersState, TextEditingController?>(
        selector: (state) => state.achievementsController,
        builder: (context, achievementsController) {
          return CustomTextFormField(
              controller: achievementsController,
              hintText: "lbl_achievement".tr,
              contentPadding: EdgeInsets.symmetric(horizontal: 21.h));
        });
  }

  /// Section Widget
  Widget _buildExperience(BuildContext context) {
    return BlocSelector<TeachersBloc, TeachersState, TextEditingController?>(
        selector: (state) => state.experienceController,
        builder: (context, experienceController) {
          return CustomTextFormField(
              controller: experienceController,
              hintText: "lbl_experience".tr,
              contentPadding: EdgeInsets.symmetric(horizontal: 21.h));
        });
  }
}
