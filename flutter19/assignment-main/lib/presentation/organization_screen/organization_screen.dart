import 'package:assignment/core/utils/navigator_service.dart';
import 'package:assignment/core/utils/size_utils.dart';
import 'package:assignment/core/utils/validation_functions.dart';
import 'package:assignment/localization/app_localization.dart';
import 'package:assignment/routes/app_routes.dart';
import 'package:assignment/theme/theme_helper.dart';
import 'package:assignment/widgets/custom_text_form_field.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import 'models/organization_model.dart';
import 'package:flutter/material.dart';
import 'bloc/organization_bloc.dart';

// ignore_for_file: must_be_immutable
class OrganizationScreen extends StatelessWidget {
  OrganizationScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<OrganizationBloc>(
        create: (context) => OrganizationBloc(
            OrganizationState(organizationModelObj: OrganizationModel()))
          ..add(OrganizationInitialEvent()),
        child: OrganizationScreen());
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<OrganizationBloc>(context);

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
                                    horizontal: 40.h, vertical: 58.v),
                                child: Column(children: [
                                  Text("lbl_organization".tr,
                                      style: theme.textTheme.bodyLarge),
                                  SizedBox(height: 35.v),
                                  _buildUserName(context),
                                  SizedBox(height: 16.v),
                                  _buildPassword(context),
                                  SizedBox(height: 16.v),
                                  _buildMobile(context),
                                  SizedBox(height: 16.v),
                                  _buildCollegeName(context),
                                  SizedBox(height: 16.v),
                                  _buildCity(context),
                                  SizedBox(height: 16.v),
                                  _buildOrgEmail(context),
                                  SizedBox(height: 16.v),
                                  CustomElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          final username = bloc
                                              .state.usernameController?.text;
                                          final password = bloc
                                              .state.passwordController?.text;
                                          final mobile =
                                              bloc.state.mobileController?.text;

                                          final cOLLEGE = bloc.state
                                              .collegeNameController?.text;
                                          final city =
                                              bloc.state.cityController?.text;
                                          final orgEmail = bloc
                                              .state.orgEmailController?.text;

                                          bloc.add(OrganizationRegister(
                                            username: username ?? "",
                                            password: password ?? "",
                                            mobile: mobile ?? "",
                                            city: city ?? "",
                                            orgEmail: orgEmail ?? "",
                                            collegeName: cOLLEGE ?? "",
                                            profilePic: '',
                                          ));
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

  /// Navigates to the verificationScreen when the action is triggered.
  onTapImgNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.verificationScreen,
    );
  }

  Widget _buildUserName(BuildContext context) {
    return BlocSelector<OrganizationBloc, OrganizationState,
            TextEditingController?>(
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
    return BlocSelector<OrganizationBloc, OrganizationState,
            TextEditingController?>(
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
    return BlocSelector<OrganizationBloc, OrganizationState,
            TextEditingController?>(
        selector: (state) => state.mobileController,
        builder: (context, mobileNumController) {
          return CustomTextFormField(
              controller: mobileNumController,
              hintText: "MOBILE",
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "mobile is required";
                }
                // if (isText(value)) {
                //   return "err_msg_please_enter_valid_text".tr;
                // }
                return null;
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 21.h));
        });
  }

  /// Section Widget
  Widget _buildCollegeName(BuildContext context) {
    return BlocSelector<OrganizationBloc, OrganizationState,
            TextEditingController?>(
        selector: (state) => state.collegeNameController,
        builder: (context, nameController) {
          return CustomTextFormField(
              controller: nameController,
              hintText: "lbl_college_name".tr,
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
  Widget _buildCity(BuildContext context) {
    return BlocSelector<OrganizationBloc, OrganizationState,
            TextEditingController?>(
        selector: (state) => state.cityController,
        builder: (context, cOLLEGEController) {
          return CustomTextFormField(
              controller: cOLLEGEController,
              hintText: "lbl_city".tr,
              contentPadding: EdgeInsets.symmetric(horizontal: 21.h));
        });
  }

  Widget _buildOrgEmail(BuildContext context) {
    return BlocSelector<OrganizationBloc, OrganizationState,
            TextEditingController?>(
        selector: (state) => state.orgEmailController,
        builder: (context, orgEmailController) {
          return CustomTextFormField(
              controller: orgEmailController,
              hintText: "lbl_org_email".tr,
              contentPadding: EdgeInsets.symmetric(horizontal: 21.h));
        });
  }
}
