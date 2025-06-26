// lib/routes/app_routes.dart
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/login/otp_screen.dart';
import '../screens/registration/head_form_screen.dart';
import '../screens/registration/member_form_screen.dart';
import '../screens/tree/family_tree_screen.dart';
import '../screens/export/export_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String otp = '/otp';
  static const String home = '/home';
  static const String headForm = '/headForm';
  static const String memberForm = '/memberForm';
  static const String tree = '/tree';
  static const String export = '/export';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case otp:
        final verificationId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => OtpScreen(verificationId: verificationId),
        );
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case headForm:
        return MaterialPageRoute(builder: (_) => const HeadFormScreen());
      case memberForm:
        return MaterialPageRoute(builder: (_) => const MemberFormScreen());
      case tree:
        return MaterialPageRoute(builder: (_) => const FamilyTreeScreen());
      case export:
        return MaterialPageRoute(builder: (_) =>  ExportScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
