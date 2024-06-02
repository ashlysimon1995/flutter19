import 'package:assignment/core/app_export.dart';
import 'package:assignment/core/utils/size_utils.dart';
import 'package:assignment/localization/app_localization.dart';
import 'package:assignment/presentation/registeration_screen/models/registeration_model.dart';
import 'package:assignment/theme/theme_helper.dart';
import 'package:assignment/widgets/custom_elevated_button.dart';
import 'package:assignment/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../core/utils/navigator_service.dart';
import '../../core/utils/validation_functions.dart';
import '../../routes/app_routes.dart';
import 'bloc/registeration_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: must_be_immutable
class RegisterationScreen extends StatelessWidget {
  RegisterationScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late SharedPreferences pref;

  static Widget builder(BuildContext context) {
    return BlocProvider<RegisterationBloc>(
        create: (context) => RegisterationBloc(
            RegisterationState(registerationModelObj: RegisterationModel()))
          ..add(RegisterationInitialEvent()),
        child: RegisterationScreen());
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RegisterationBloc>(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(horizontal: 56.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 14.v),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text("lbl_sign_in".tr,
                                          style:
                                              theme.textTheme.headlineLarge)),
                                  SizedBox(height: 31.v),
                                  Padding(
                                      padding: EdgeInsets.only(left: 19.h),
                                      child: BlocSelector<
                                              RegisterationBloc,
                                              RegisterationState,
                                              TextEditingController?>(
                                          selector: (state) =>
                                              state.usernameController,
                                          builder: (context, emailController) {
                                            return CustomTextFormField(
                                                controller: emailController,
                                                hintText: "username".tr,
                                                hintStyle:
                                                    theme.textTheme.titleLarge!,
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
                                                borderDecoration:
                                                    TextFormFieldStyleHelper
                                                        .fillPrimary,
                                                filled: true,
                                                fillColor:
                                                    theme.colorScheme.primary);
                                          })),
                                  SizedBox(height: 35.v),
                                  Padding(
                                      padding: EdgeInsets.only(left: 19.h),
                                      child: BlocSelector<
                                              RegisterationBloc,
                                              RegisterationState,
                                              TextEditingController?>(
                                          selector: (state) =>
                                              state.passwordController,
                                          builder:
                                              (context, passwordController) {
                                            return CustomTextFormField(
                                                controller: passwordController,
                                                hintText: "lbl_password".tr,
                                                hintStyle:
                                                    theme.textTheme.titleLarge!,
                                                textInputAction:
                                                    TextInputAction.done,
                                                textInputType: TextInputType
                                                    .visiblePassword,
                                                validator: (value) {
                                                  if (value == null ||
                                                      (!isValidPassword(value,
                                                          isRequired: true))) {
                                                    return "err_msg_please_enter_valid_password"
                                                        .tr;
                                                  }
                                                  return null;
                                                },
                                                obscureText: true,
                                                borderDecoration:
                                                    TextFormFieldStyleHelper
                                                        .fillPrimary,
                                                filled: true,
                                                fillColor:
                                                    theme.colorScheme.primary);
                                          })),
                                  SizedBox(height: 34.v),
                                  InkWell(
                                    onTap: () {
                                      onTapImgNext(context);
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(right: 73.h),
                                        child: Text("lbl_sign_up".tr,
                                            style: theme.textTheme.titleLarge)),
                                  ),
                                  SizedBox(height: 60.v),
                                  CustomElevatedButton(
                                      onPressed: () {
                                        final username =
                                            bloc.state.usernameController!.text;
                                        final password =
                                            bloc.state.passwordController!.text;

                                        // Dispatch the sign-in event with email and password
                                        bloc.add(SignInButtonClickedEvent(
                                            username: username,
                                            password: password));
                                      },
                                      height: 42.v,
                                      text: "Sign In",
                                      margin: EdgeInsets.only(
                                          left: 38.h, right: 19.h),
                                      buttonTextStyle:
                                          theme.textTheme.titleLarge!),
                                  SizedBox(height: 50.v),
                                  // CustomImageView(
                                  //     imagePath: ImageConstant.imgNext,
                                  //     height: 60.v,
                                  //     alignment: Alignment.center,
                                  //     onTap: () {
                                  //       onTapImgNext(context);
                                  //     })
                                ])))))));
  }

  /// Navigates to the roleScreen when the action is triggered.
  onTapImgNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.roleScreen,
    );
  }
}
