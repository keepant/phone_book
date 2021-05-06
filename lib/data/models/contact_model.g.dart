// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) {
  return ContactModel(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => ContactData.fromJson(e as Map<String, dynamic>))
        .toList(),
    error: json['error'] as String?,
  );
}

Map<String, dynamic> _$ContactModelToJson(ContactModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'error': instance.error,
    };

ContactData _$ContactDataFromJson(Map<String, dynamic> json) {
  return ContactData(
    id: json['id'] as int?,
    name: json['name'] as String?,
    phone: json['phone'] as String?,
    job: json['job'] as String?,
    company: json['company'] as String?,
    email: json['email'] as String?,
    image: json['image'] as String?,
    error: json['error'] as String?,
  );
}

Map<String, dynamic> _$ContactDataToJson(ContactData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'job': instance.job,
      'company': instance.company,
      'email': instance.email,
      'image': instance.image,
      'error': instance.error,
    };
