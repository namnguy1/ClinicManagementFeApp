import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:clinic_management_app/features/auth/screens/Login/login_screen.dart';
import 'package:clinic_management_app/features/auth/screens/Login/otpSuccess_screen.dart' show NewPasswordScreen;
import 'package:clinic_management_app/features/auth/screens/Register/createpw_register_screen.dart';
import 'package:clinic_management_app/features/auth/screens/Register/register_screen.dart';
import 'package:clinic_management_app/features/auth/screens/Welcome/welcome_screen.dart';
import 'package:clinic_management_app/features/auth/screens/Login/otp_forgotpw_screen.dart';
import 'package:clinic_management_app/features/auth/screens/Register/otp_register_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/create-password',
      builder: (context, state) => const CreatePasswordScreen(),
    ),
    GoRoute(
      path: '/otp-forgot',
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>?;
        return OtpForgotPasswordScreen(
          verificationId: args?['verificationId'] ?? '',
          phoneNumber: args?['phoneNumber'] ?? '',
        );
      },
    ),
    GoRoute(
      path: '/otp-register',
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>?;
        return OtpRegisterScreen(
          verificationId: args?['verificationId'] ?? '',
          phoneNumber: args?['phoneNumber'] ?? '',
        );
      },
    ),
    GoRoute(
      path: '/new-password',
      builder: (context, state) => const NewPasswordScreen(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Page not found: ${state.error}'),
    ),
  ),
); 