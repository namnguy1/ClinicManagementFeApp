import 'package:flutter/material.dart';
import 'package:clinic_management_app/screens/Register/createpw_register_screen.dart';

class OtpScreen extends StatelessWidget {
  /// isForgotFlow = true khi từ ForgotPassword
  /// isForgotFlow = false khi từ Register
  final bool isForgotFlow;

  const OtpScreen({Key? key, required this.isForgotFlow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2196F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2196F3),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Logo block
          Container(
            width: double.infinity,
            color: const Color(0xFF2196F3),
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Center(
              child: Image.asset(
                'assets/images/home_logo2.png',
                height: 80,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Form block
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Nhập mã xác thực',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A237E),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Vui lòng không chia sẻ mã xác thực để tránh mất tài khoản',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(5, (index) {
                        return SizedBox(
                          width: 48,
                          height: 56,
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              fillColor: const Color(0xFFF3F5F9),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Nút Tiếp tục
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (isForgotFlow) {
                            // Quên mật khẩu → đến màn OTP Success
                            Navigator.pushNamed(context, '/otp_success');
                          } else {
                            // Đăng ký → đến CreatePassword
                            Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const CreatePasswordScreen(),
                              transitionsBuilder: (_, animation, __, child) {
                                final tween = Tween(begin: const Offset(1, 0), end: Offset.zero)
                                    .chain(CurveTween(curve: Curves.ease));
                                return SlideTransition(position: animation.drive(tween), child: child);
                              },
                            ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2196F3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Tiếp tục',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}