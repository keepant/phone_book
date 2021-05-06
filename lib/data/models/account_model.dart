import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  final bool? status;
  final String? message;
  final AccountData? data;
  final String? error;

  AccountModel({this.status, this.message, this.data, this.error});

  factory AccountModel.withError(String? errorMesssage) {
    return AccountModel(error: errorMesssage);
  }

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return _$AccountModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AccountModelToJson(this);
  }
}

@JsonSerializable()
class AccountData {
  final int? id;
  final String? name;
  final String? password;
  final String? email;
  final String? token;
  final String? createdAt;
  final String? updatedAt;

  AccountData({
    this.id,
    this.name,
    this.password,
    this.email,
    this.token,
    this.createdAt,
    this.updatedAt,
  });

  factory AccountData.fromJson(Map<String, dynamic> json) {
    return _$AccountDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AccountDataToJson(this);
  }
}
