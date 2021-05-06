import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_book/data/db/favorite_contact_db.dart';
import 'package:phone_book/data/models/contact_model.dart';
import 'package:phone_book/providers/contact_provider.dart';
import 'package:phone_book/screens/contact/add_contact_screen.dart';
import 'package:phone_book/screens/contact/edit_contact_screen.dart';
import 'package:phone_book/widgets/custom_contact_card.dart';
import 'package:phone_book/widgets/custom_dialog.dart';
import 'package:phone_book/widgets/custom_loading.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _contact = Provider.of<ContactProvider>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddContactScreen()),
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<ContactModel>(
        future: _contact.getAllContact(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.hasData) {
            ContactModel contact = snapshot.data!;
            return contact.data!.length == 0
                ? Center(
                    child: Text('Data empty'),
                  )
                : ListView.builder(
                    key: PageStorageKey('contactList'),
                    padding: const EdgeInsets.all(16.0),
                    shrinkWrap: true,
                    itemCount: contact.data!.length,
                    itemBuilder: (context, index) {
                      return CustomContactCard(
                        name: contact.data![index].name!,
                        detail: contact.data![index].phone!,
                        img: contact.data?[index].image ?? '',
                        onTap: () => Get.to(
                            () => EditContactScreen(contact.data![index])),
                        onPressedFav: () {
                          final favContact = FavoriteContactDB();
                          favContact.addFavoriteContact(
                            name: contact.data![index].name!,
                            phone: contact.data![index].phone!,
                            email: contact.data![index].email!,
                            job: contact.data![index].job!,
                            company: contact.data![index].company!,
                            imgUrl: contact.data![index].image ?? '',
                          );
                        },
                        onPressedDel: () {
                          customDialog(
                            title: 'Delete',
                            content: Text('Are you sure?'),
                            onPressed: () async {
                              await _contact
                                  .deleteContactById(contact.data![index].id!);
                              Get.back();
                            },
                          );
                        },
                      );
                    },
                  );
          }

          return CustomLoading();
        },
      ),
    );
  }
}
