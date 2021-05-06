import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:phone_book/data/api/api_service.dart';
import 'package:phone_book/data/local_storage/preferences.dart';
import 'package:phone_book/data/models/account_model.dart';
import 'package:phone_book/screens/auth/login_screen.dart';
import 'package:phone_book/screens/home_screen.dart';
import 'package:phone_book/utils/helper.dart';

class AuthAPI {
  Future<String> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'name': name,
        'email': email,
        'password': password,
      });
      Response response = await httpClient.post(
        'api/v1/signup',
        data: formData,
      );
      print('response register: ${response.data}');

      if (response.data['status']) {
        Get.to(() => LoginScreen());
        snackBar(
          title: 'Register success!',
          message: response.data['message'],
        );
      } else {
        snackBar(
          title: 'Register failed!',
          message: response.data['data'],
        );
      }

      return response.data['message'];
    } on DioError catch (e) {
      print('error register ---> $e');
      return e.toString();
    }
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final _prefs = await Preferences.init();

      FormData formData = FormData.fromMap({
        'email': email,
        'password': password,
      });
      Response response = await httpClient.post(
        'api/v1/signin',
        data: formData,
      );

      AccountModel.fromJson(response.data);

      print('response login: ${response.data}');

      if (response.data['status']) {
        _prefs.token = response.data['data']['token'];

        Get.off(() => HomeScreen());

        snackBar(
          title: 'Login success!',
          message: response.data['message'],
        );
      } else {
        snackBar(
          title: 'Login failed!',
          message: response.data['data'],
        );
      }

      return response.data['message'];
    } on DioError catch (e) {
      print('error login ---> $e');
      return e.toString();
    }
  }

  Future<void> logout() async {
    final _prefs = await Preferences.init();
    _prefs.token = '0';
    Get.off(() => LoginScreen());

    snackBar(
      title: 'Logout success!',
      message: 'Thanks for using app.',
    );
  }
}
