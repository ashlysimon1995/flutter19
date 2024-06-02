import 'package:flutter/material.dart';
import '../presentation/registeration_screen/registeration_screen.dart';
import '../presentation/role_screen/role_screen.dart';
import '../presentation/students_screen/students_screen.dart';
import '../presentation/teachers_screen/teachers_screen.dart';
import '../presentation/organization_screen/organization_screen.dart';
import '../presentation/verification_screen/verification_screen.dart';
import '../presentation/recommendation_screen/recommendation_screen.dart';
import '../presentation/home_container_screen/home_container_screen.dart';
import '../presentation/chat_screen/chat_screen.dart';
import '../presentation/events_screen/events_screen.dart';
import '../presentation/profile_screen/profile_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String registerationScreen = '/registeration_screen';

  static const String roleScreen = '/role_screen';

  static const String studentsScreen = '/students_screen';

  static const String teachersScreen = '/teachers_screen';

  static const String organizationScreen = '/organization_screen';

  static const String verificationScreen = '/verification_screen';

  static const String recommendationScreen = '/recommendation_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String chatScreen = '/chat_screen';

  static const String eventsScreen = '/events_screen';

  static const String profileScreen = '/profile_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        initialRoute: RegisterationScreen.builder,
        registerationScreen: RegisterationScreen.builder,
        roleScreen: RoleScreen.builder,
        studentsScreen: StudentsScreen.builder,
        teachersScreen: TeachersScreen.builder,
        organizationScreen: OrganizationScreen.builder,
        verificationScreen: VerificationScreen.builder,
        recommendationScreen: RecommendationScreen.builder,
        homeContainerScreen: HomeContainerScreen.builder,
        chatScreen: ChatScreen.builder,
        eventsScreen: EventsScreen.builder,
        profileScreen: ProfileScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
      };
}
