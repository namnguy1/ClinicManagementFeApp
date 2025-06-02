import 'package:clinic_management_app/features/auth/widgets/welcome_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<Offset> _logoOffset;
  late Animation<double> _logoOpacity;

  late AnimationController _buttonController;
  late Animation<Offset> _buttonOffset;
  late Animation<double> _buttonOpacity;

  @override
  void initState() {
    super.initState();

    // Logo animation
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _logoOffset = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _logoController, curve: Curves.easeOut));
    _logoOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _logoController, curve: Curves.easeIn));

    // Button animation
    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _buttonOffset = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _buttonController, curve: Curves.easeOut));
    _buttonOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _buttonController, curve: Curves.easeIn));

    // Start animations
    _logoController.forward().then((_) => _buttonController.forward());
  }

  @override
  void dispose() {
    _logoController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFEFF3FF),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            const Text(
              'PHÒNG KHÁM GIA ĐÌNH AN TÂM',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A237E),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 4),

            const Text(
              'Chăm sóc sức khỏe từ trái tim',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Color(0xFF3F51B5),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // Logo + hình minh họa có animation
            SizedBox(
              height: screenHeight * 0.50,
              child: FadeTransition(
                opacity: _logoOpacity,
                child: SlideTransition(
                  position: _logoOffset,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: 0,
                        child: Image.asset(
                          'assets/images/home_logo.png',
                          height: screenHeight * 0.20,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Image.asset(
                          'assets/images/family.png',
                          height: screenHeight * 0.35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const Spacer(),

            // Nút có hiệu ứng
            FadeTransition(
              opacity: _buttonOpacity,
              child: SlideTransition(
                position: _buttonOffset,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
                  child: Column(
                    children: [
                      WelcomeButton(
                        text: 'ĐĂNG NHẬP',
                        filled: true,
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                      const SizedBox(height: 16),
                      WelcomeButton(
                        text: 'ĐĂNG KÝ MỚI',
                        filled: false,
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
