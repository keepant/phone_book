import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:phone_book/data/models/favorite_contact_model.dart';

class FavoriteContactDB {
  final String _box = 'favorite_contact';

  int _reverseOrder(k1, k2) {
    if (k1 is int) {
      if (k2 is int) {
        if (k1 > k2) {
          return -1;
        } else if (k1 < k2) {
          return 1;
        } else {
          return 0;
        }
      } else {
        return -1;
      }
    }

    return -1;
  }

  Future<void> init() async {
    Hive.registerAdapter<FavoriteContactModel>(FavoriteContactModelAdapter());
    await Hive.openBox<FavoriteContactModel>(
      _box,
      keyComparator: (k1, k2) => _reverseOrder(k1, k2),
    );
  }

  void addFavoriteContact({
    required String name,
    required String phone,
    required String email,
    required String job,
    required String company,
    required String imgUrl,
  }) {
    Box<FavoriteContactModel> contact = Hive.box<FavoriteContactModel>(_box);
    contact.add(FavoriteContactModel(
      name: name,
      phone: phone,
      email: email,
      job: job,
      company: company,
      imgUrl: imgUrl,
    ));
  }

  ValueListenable<Box<FavoriteContactModel>> getFavoriteContact() =>
      Hive.box<FavoriteContactModel>(_box).listenable();
}
