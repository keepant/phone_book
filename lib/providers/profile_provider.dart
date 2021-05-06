import 'package:flutter/material.dart';
import 'package:phone_book/data/api/profile_api.dart';
import 'package:phone_book/data/models/account_model.dart';

class ProfileProvider extends ChangeNotifier {
  final _profileAPI = ProfileApi();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set _loading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  AccountModel _accountModel = AccountModel();
  AccountModel get contact => _accountModel;

  set _account(AccountModel value) {
    _accountModel = value;
    notifyListeners();
  }

  Future<AccountModel> updateProfile({String? name, String? email}) async {
    _loading = true;
    AccountModel result =
        await _profileAPI.updateProfile(name: name, email: email);
    _account = result;
    _loading = false;

    return _accountModel;
  }

  Future<String> updatePassword(String password) async {
    _loading = true;
    String result = await _profileAPI.updatePassword(password: password);
    _loading = false;

    return result;
  }
}
