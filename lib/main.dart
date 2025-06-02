
import 'package:clinic_management_app/features/auth/screens/Login/login_screen.dart';
import 'package:clinic_management_app/features/auth/screens/Login/otpSuccess_screen.dart';
import 'package:clinic_management_app/features/auth/screens/Register/createpw_register_screen.dart';
import 'package:clinic_management_app/features/auth/screens/Register/register_screen.dart';
import 'package:clinic_management_app/features/auth/screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import classes

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // CẦN THIẾT để khởi tạo Firebase
  await Firebase.initializeApp(); // KHỞI TẠO FIREBASE
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
