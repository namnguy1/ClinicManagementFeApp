import 'package:clinic_management_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

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
        '/login': (context) => const Placeholder(),     // thay bằng LoginScreen sau
        '/register': (context) => const Placeholder(),  // thay bằng RegisterScreen sau
      },
    );
  }
}