import 'package:dio/dio.dart';
import 'package:phone_book/data/api/api_service.dart';
import 'package:phone_book/data/local_storage/preferences.dart';
import 'package:phone_book/data/models/account_model.dart';
import 'package:phone_book/utils/helper.dart';

class ProfileApi {
  Future<AccountModel> updateProfile({
    String? name,
    String? email,
  }) async {
    try {
      final _prefs = await Preferences.init();

      FormData formData = FormData.fromMap({
        'name': name,
        'email': email,
      });

      Response response = await httpClient.put(
        'api/v1/users/profile',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_prefs.token}',
          },
        ),
        data: formData,
      );

      if (response.data['status']) {
        snackBar(
          title: 'Update profile success!',
          message: response.data['message'],
        );
      } else {
        snackBar(
          title: 'Update profile failed!',
          message: response.data['data'],
        );
      }

      return AccountModel.fromJson(response.data);
    } on DioError catch (e) {
      print('error login ---> $e');
      return AccountModel.withError(e.toString());
    }
  }

  Future<String> updatePassword({
    String? password,
  }) async {
    try {
      final _prefs = await Preferences.init();

      FormData formData = FormData.fromMap({
        'password': password,
      });

      Response response = await httpClient.put(
        'api/v1/users/password',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_prefs.token}',
          },
        ),
        data: formData,
      );

      if (response.data['status']) {
        snackBar(
          title: 'Update password success!',
          message: response.data['message'],
        );
      } else {
        snackBar(
          title: 'Update password failed!',
          message: response.data['data'],
        );
      }

      return response.data['message'];
    } on DioError catch (e) {
      print('error login ---> $e');
      return e.toString();
    }
  }
}
