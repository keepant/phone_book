import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:phone_book/data/db/favorite_contact_db.dart';
import 'package:phone_book/data/models/favorite_contact_model.dart';
import 'package:phone_book/widgets/custom_contact_card.dart';

class FavoriteContactScreen extends StatelessWidget {
  final _favContact = FavoriteContactDB();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _favContact.getFavoriteContact(),
        builder: (context, Box<FavoriteContactModel> box, _) {
          return box.length == 0
              ? Center(
                  child: Text('Favorite contact empty'),
                )
              : ListView.builder(
                  key: PageStorageKey('favContact'),
                  padding: const EdgeInsets.all(16.0),
                  shrinkWrap: true,
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    FavoriteContactModel? contact = box.getAt(index);
                    return CustomContactCard(
                      isFav: true,
                      name: contact!.name,
                      detail: contact.name,
                      img: contact.imgUrl,
                      onTap: () => null,
                      onPressedFav: () => contact.delete(),
                    );
                  },
                );
        },
      ),
    );
  }
}
