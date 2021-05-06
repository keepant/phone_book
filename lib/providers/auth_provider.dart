import 'package:flutter/material.dart';
import 'package:phone_book/data/api/auth_api.dart';

class AuthProvider extends ChangeNotifier {
  final _auth = AuthAPI();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set loading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<String> register({
    required String name,
    required String email,
    required String password,
  }) async {
    loading = true;
    String result = await _auth.register(
      name: name,
      email: email,
      password: password,
    );
    loading = false;
    return result;
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    loading = true;
    String result = await _auth.login(
      email: email,
      password: password,
    );
    loading = false;
    return result;
  }
}
