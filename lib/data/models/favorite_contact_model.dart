import 'package:hive/hive.dart';

part 'favorite_contact_model.g.dart';

@HiveType(typeId: 0)
class FavoriteContactModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String phone;

  @HiveField(2)
  String email;

  @HiveField(3)
  String job;

  @HiveField(4)
  String company;

  @HiveField(5)
  String imgUrl;

  FavoriteContactModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.job,
    required this.company,
    required this.imgUrl,
  });
}
