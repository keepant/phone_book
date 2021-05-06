import 'package:dio/dio.dart';
import 'package:phone_book/data/api/api_service.dart';
import 'package:phone_book/data/local_storage/preferences.dart';
import 'package:phone_book/data/models/contact_model.dart';
import 'package:phone_book/utils/helper.dart';

class ContactApi {
  Future<ContactModel> getAllContact() async {
    try {
      final _prefs = await Preferences.init();
      ContactModel _contactModel;

      Response response = await httpClient.get(
        'api/v1/contacts',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_prefs.token}',
          },
        ),
      );

      _contactModel = ContactModel.fromJson(response.data);

      return _contactModel;
    } on DioError catch (e) {
      print('error login ---> $e');
      return ContactModel.withError(e.toString());
    }
  }

  Future<ContactData> getContactById(int id) async {
    try {
      final _prefs = await Preferences.init();
      ContactData _contactData;

      Response response = await httpClient.get(
        'api/v1/contacts/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_prefs.token}',
          },
        ),
      );

      _contactData = ContactData.fromJson(response.data);

      return _contactData;
    } on DioError catch (e) {
      print('error login ---> $e');
      return ContactData.withError(e.toString());
    }
  }

  Future<String> addContact({
    String? name,
    String? phone,
    String? job,
    String? company,
    String? email,
    String? image,
  }) async {
    try {
      final _prefs = await Preferences.init();

      FormData formData = FormData.fromMap({
        'name': name,
        'phone': phone,
        'job': job,
        'company': company,
        'email': email,
        'image': image != null ? await MultipartFile.fromFile(image) : null,
      });

      Response response = await httpClient.post(
        'api/v1/contacts',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_prefs.token}',
          },
        ),
        data: formData,
      );

      if (response.data['status']) {
        snackBar(
          title: 'Insert success!',
          message: response.data['message'],
        );
      } else {
        snackBar(
          title: 'Insert failed!',
          message: response.data['data'],
        );
      }

      return response.data['message'];
    } on DioError catch (e) {
      print('error login ---> $e');
      return e.toString();
    }
  }

  Future<String> updateContactById({
    required int id,
    String? name,
    String? phone,
    String? job,
    String? company,
    String? email,
    String? image,
  }) async {
    try {
      final _prefs = await Preferences.init();

      FormData formData = FormData.fromMap({
        'name': name,
        'phone': phone,
        'job': job,
        'company': company,
        'email': email,
        'image': image != null ? await MultipartFile.fromFile(image) : null,
      });

      Response response = await httpClient.put(
        'api/v1/contacts/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_prefs.token}',
          },
        ),
        data: formData,
      );

      if (response.data['status']) {
        snackBar(
          title: 'Update success!',
          message: response.data['message'],
        );
      } else {
        snackBar(
          title: 'Update failed!',
          message: response.data['data'],
        );
      }

      return response.data['message'];
    } on DioError catch (e) {
      print('error login ---> $e');
      return e.toString();
    }
  }

  Future<String> deleteContactById(int id) async {
    try {
      final _prefs = await Preferences.init();

      Response response = await httpClient.delete(
        'api/v1/contacts/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_prefs.token}',
          },
        ),
      );

      if (response.data['status']) {
        snackBar(
          title: 'Delete success!',
          message: response.data['message'],
        );
      } else {
        snackBar(
          title: 'Delete failed!',
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
