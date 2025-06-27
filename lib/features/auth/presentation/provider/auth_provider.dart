import 'package:flutter/material.dart';

enum AuthStatus { initial, loading, success, error }

class AuthProvider extends ChangeNotifier {
  AuthStatus _status = AuthStatus.initial;
  String? _errorMessage;

  AuthStatus get status => _status;
  String? get errorMessage => _errorMessage;

  Future<void> login(String phone, String password) async {
    _status = AuthStatus.loading;
    notifyListeners();
    try {
      // TODO: Thay bằng logic login thực tế
      await Future.delayed(const Duration(seconds: 2));
      _status = AuthStatus.success;
      notifyListeners();
    } catch (e) {
      _status = AuthStatus.error;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> forgotPassword(String phone) async {
    _status = AuthStatus.loading;
    notifyListeners();
    try {
      // TODO: Thay bằng logic forgot password thực tế
      await Future.delayed(const Duration(seconds: 2));
      _status = AuthStatus.success;
      notifyListeners();
    } catch (e) {
      _status = AuthStatus.error;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  void reset() {
    _status = AuthStatus.initial;
    _errorMessage = null;
    notifyListeners();
  }
} 