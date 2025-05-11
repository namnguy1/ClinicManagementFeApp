
import 'package:clinic_management_app/screens/Login/otpSuccess_screen.dart';
import 'package:clinic_management_app/screens/Register/createpw_register_screen.dart';
import 'package:flutter/material.dart';

// import classes
import 'package:clinic_management_app/screens/Login/login_screen.dart';
import 'package:clinic_management_app/screens/welcome/welcome_screen.dart';
import 'package:clinic_management_app/screens/Register/register_screen.dart';
import 'package:clinic_management_app/screens/Register/otp_register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clinic App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/register': (context) => const RegisterScreen(),
        // '/otp': (context) => const OtpScreen(),
        '/login': (context) => const LoginScreen(),
        // '/forgot': (context) => const OtpScreen(),
        '/otp_success': (c) => const OtpSuccessScreen(),
        '/create_password': (c) => const CreatePasswordScreen(),
      },
    );
  }
}
