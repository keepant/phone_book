import 'package:flutter/material.dart';
import 'package:phone_book/screens/account/account_screen.dart';
import 'package:phone_book/screens/contact/contact_screen.dart';
import 'package:phone_book/screens/contact/favorite_contact_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Phone Book'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.contacts_rounded),
                text: 'Contact',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favorite',
              ),
              Tab(
                icon: Icon(Icons.account_circle),
                text: 'Account',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ContactScreen(),
            FavoriteContactScreen(),
            AccountScreen(),
          ],
        ),
      ),
    );
  }
}
