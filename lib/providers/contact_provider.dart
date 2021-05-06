import 'package:flutter/material.dart';
import 'package:phone_book/data/api/contact_api.dart';
import 'package:phone_book/data/models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  final _contactAPI = ContactApi();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set _loading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  ContactModel _contactModel = ContactModel();
  ContactModel get contact => _contactModel;

  set _contact(ContactModel value) {
    _contactModel = value;
    notifyListeners();
  }

  Future<ContactModel> getAllContact() async {
    ContactModel result = await _contactAPI.getAllContact();
    _contact = result;
    return _contactModel;
  }

  Future<String> addContact({
    String? name,
    String? phone,
    String? job,
    String? company,
    String? email,
    String? image,
  }) async {
    _loading = true;
    String result = await _contactAPI.addContact(
      name: name,
      phone: phone,
      job: job,
      company: company,
      email: email,
      image: image,
    );
    _loading = false;

    return result;
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
    _loading = true;
    String result = await _contactAPI.updateContactById(
      id: id,
      name: name,
      phone: phone,
      job: job,
      company: company,
      email: email,
      image: image,
    );
    _loading = false;

    return result;
  }

  Future<String> deleteContactById(int id) async {
    _loading = true;
    String result = await _contactAPI.deleteContactById(id);
    _loading = false;

    return result;
  }
}
