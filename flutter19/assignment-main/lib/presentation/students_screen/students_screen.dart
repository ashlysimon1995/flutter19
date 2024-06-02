import 'dart:developer';

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
import 'package:assignment/widgets/custom_icon_button.dart';
import '../../widgets/custom_elevated_button.dart';
import 'models/students_model.dart';
import 'package:flutter/material.dart';
import 'bloc/students_bloc.dart';

// ignore_for_file: must_be_immutable
class StudentsScreen extends StatelessWidget {
  StudentsScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<StudentsBloc>(
        create: (context) =>
            StudentsBloc(StudentsState(studentsModelObj: StudentsModel()))
              ..add(StudentsInitialEvent()),
        child: StudentsScreen());
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<StudentsBloc>(context);

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 38.h, vertical: 22.v),
                            child: Column(children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 72.h),
                                      child: Text("lbl_details".tr,
                                          style:
                                              theme.textTheme.headlineLarge))),
                              SizedBox(height: 13.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 94.h),
                                      child: Text("lbl_students".tr,
                                          style: theme.textTheme.bodyLarge))),
                              SizedBox(height: 31.v),
                              _buildUserName(context),
                              SizedBox(height: 31.v),
                              _buildPassword(context),
                              SizedBox(height: 26.v),
                              _buildMobile(context),
                              SizedBox(height: 26.v),
                              _buildName(context),
                              SizedBox(height: 26.v),
                              _buildCOLLEGE(context),
                              SizedBox(height: 20.v),
                              _buildDEGREE(context),
                              SizedBox(height: 25.v),
                              _buildCORESKILLS(context),
                              SizedBox(height: 24.v),
                              _buildHOBBIES(context),
                              SizedBox(height: 24.v),
                              _buildPrice(context),
                              SizedBox(height: 54.v),
                              CustomElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      final username =
                                          bloc.state.usernameController?.text;
                                      final password =
                                          bloc.state.passwordController?.text;
                                      final name =
                                          bloc.state.nameController?.text;
                                      final cOLLEGE =
                                          bloc.state.cOLLEGEController?.text;
                                      final dEGREE =
                                          bloc.state.dEGREEController?.text;
                                      final cORESKILLS =
                                          bloc.state.cORESKILLSController?.text;
                                      final hOBBIES =
                                          bloc.state.hOBBIESController?.text;
                                      final achievements = bloc
                                          .state.achievementsController?.text;
                                      final mobile =
                                          bloc.state.mobileNumController?.text;
                                      bloc.add(StudentRegister(
                                          username: username ?? "",
                                          password: password ?? "",
                                          name: name ?? "",
                                          cOLLEGE: cOLLEGE ?? "",
                                          dEGREE: dEGREE ?? "",
                                          cORESKILLS: cORESKILLS ?? "",
                                          hOBBIES: hOBBIES ?? "",
                                          achievements: achievements ?? "",
                                          mobileNum: mobile ?? ""));
                                    }
                                    onTapBtnNext(context);
                                  },
                                  height: 42.v,
                                  text: "Register",
                                  margin:
                                      EdgeInsets.only(left: 38.h, right: 19.h),
                                  buttonTextStyle: theme.textTheme.titleLarge!),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  Widget _buildUserName(BuildContext context) {
    return BlocSelector<StudentsBloc, StudentsState, TextEditingController?>(
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
    return BlocSelector<StudentsBloc, StudentsState, TextEditingController?>(
        selector: (state) => state.passwordController,
        builder: (context, passwordController) {
          return CustomTextFormField(
              controller: passwordController,
              hintText: "lbl_password".tr,
              textInputAction: TextInputAction.done,
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
    return BlocSelector<StudentsBloc, StudentsState, TextEditingController?>(
        selector: (state) => state.mobileNumController,
        builder: (context, mobileNumController) {
          return CustomTextFormField(
              controller: mobileNumController,
              hintText: "MOBILE",
              validator: (value) {
                log(value.toString());
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
    return BlocSelector<StudentsBloc, StudentsState, TextEditingController?>(
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
    return BlocSelector<StudentsBloc, StudentsState, TextEditingController?>(
        selector: (state) => state.cOLLEGEController,
        builder: (context, cOLLEGEController) {
          return CustomTextFormField(
              controller: cOLLEGEController,
              hintText: "lbl_college".tr,
              contentPadding: EdgeInsets.symmetric(horizontal: 21.h));
        });
  }

  /// Section Widget
  Widget _buildDEGREE(BuildContext context) {
    return BlocSelector<StudentsBloc, StudentsState, TextEditingController?>(
        selector: (state) => state.dEGREEController,
        builder: (context, dEGREEController) {
          return CustomTextFormField(
              controller: dEGREEController,
              hintText: "lbl_degree".tr,
              contentPadding: EdgeInsets.symmetric(horizontal: 21.h));
        });
  }

  /// Section Widget
  Widget _buildCORESKILLS(BuildContext context) {
    return BlocSelector<StudentsBloc, StudentsState, TextEditingController?>(
        selector: (state) => state.cORESKILLSController,
        builder: (context, cORESKILLSController) {
          return CustomTextFormField(
              controller: cORESKILLSController,
              hintText: "lbl_core_skills".tr,
              contentPadding: EdgeInsets.symmetric(horizontal: 21.h));
        });
  }

  /// Section Widget
  Widget _buildHOBBIES(BuildContext context) {
    return BlocSelector<StudentsBloc, StudentsState, TextEditingController?>(
        selector: (state) => state.hOBBIESController,
        builder: (context, hOBBIESController) {
          return CustomTextFormField(
              controller: hOBBIESController,
              hintText: "lbl_hobbies".tr,
              contentPadding: EdgeInsets.symmetric(horizontal: 21.h));
        });
  }

  /// Section Widget
  Widget _buildPrice(BuildContext context) {
    return BlocSelector<StudentsBloc, StudentsState, TextEditingController?>(
        selector: (state) => state.achievementsController,
        builder: (context, priceController) {
          return CustomTextFormField(
              controller: priceController,
              hintText: "lbl_acheivements".tr,
              textInputAction: TextInputAction.done,
              contentPadding: EdgeInsets.symmetric(horizontal: 21.h));
        });
  }

  /// Navigates to the teachersScreen when the action is triggered.
  onTapBtnNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.teachersScreen,
    );
  }
}
