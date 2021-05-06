import 'package:json_annotation/json_annotation.dart';

part 'contact_model.g.dart';

@JsonSerializable()
class ContactModel {
  final bool? status;
  final String? message;
  final List<ContactData>? data;
  final String? error;

  ContactModel({this.status, this.message, this.data, this.error});

  factory ContactModel.withError(String? errorMesssage) {
    return ContactModel(error: errorMesssage);
  }

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return _$ContactModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ContactModelToJson(this);
  }
}

@JsonSerializable()
class ContactData {
  final int? id;
  final String? name;
  final String? phone;
  final String? job;
  final String? company;
  final String? email;
  final String? image;
  final String? error;

  ContactData({
    this.id,
    this.name,
    this.phone,
    this.job,
    this.company,
    this.email,
    this.image,
    this.error,
  });

  factory ContactData.withError(String? errorMesssage) {
    return ContactData(error: errorMesssage);
  }

  factory ContactData.fromJson(Map<String, dynamic> json) {
    return _$ContactDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ContactDataToJson(this);
  }
}
